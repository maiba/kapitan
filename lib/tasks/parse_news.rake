namespace :parse do

  require 'nokogiri'
  require 'open-uri'

  class NewsItemRaw
    attr_accessor :title, :content, :link
    def initialize (title, content, link)
      @title, @content, @link = title, content, link
    end
  end

  desc "Parse some news"
  task :news => :environment do
    doc = Nokogiri::HTML(open('http://www.proreklamu.com/news/news-advertising.html'))
    rows = doc.xpath("//div[@class='rt-article-bg']")

    news = Array.new
    rows.collect do |row|
      l = lambda {|xpath| row.at_xpath(xpath).to_s.strip}

      news << NewsItemRaw.new(
        l.call("div[@class='rt-headline']/h1[@class='rt-article-title']/a/text()"),
        l.call("div[@class='rt-article-content']/p/text()"),
        l.call("div[@class='rt-article-content']/p[@class='rt-readon-surround']/a/@href")
      )
    end

    last_saved = NewsItem.order("created_at desc").last

    item_to_save = news.detect {|item| !(item.title.eql?(last_saved.title))}
    puts item_to_save.title

    news_item = NewsItem.new(item_to_save.title, item_to_save.content, item_to_save.link)
    news_item.save
  end
end