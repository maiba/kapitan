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

    last_saved = NewsItem.select("title").order("created_at desc").limit(10)
    last_saved.each do |item|
      puts item.title
    end

    item_to_save = news.detect {|item|  !(last_saved.include?(item.title))}

    news_item = NewsItem.new
    news_item.title = item_to_save.title
    news_item.content = item_to_save.content
    news_item.link = "http://www.proreklamu.com" + item_to_save.link
    puts item_to_save.link
    news_item.save
  end
end