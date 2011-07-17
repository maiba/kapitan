namespace :parse do

  require 'nokogiri'
  require 'open-uri'

  desc "Parse some news"
  task :news => :environment do
    doc = Nokogiri::HTML(open('http://www.proreklamu.com/news/news-advertising.html'))
    rows = doc.xpath("//div[@class='rt-article-bg']")

    news = Array.new
    rows.collect do |row|
      l = lambda {|xpath| row.at_xpath(xpath).to_s.strip}

      news << NewsItem.new(
        l.call("div[@class='rt-headline']/h1[@class='rt-article-title']/a/text()"),
        l.call("div[@class='rt-article-content']/p/text()"),
        l.call("div[@class='rt-article-content']/p[@class='rt-readon-surround']/a/@href")
      )
    end

    lastSaved = NewsItem.order("created_at desc").last

    itemToSave = news.detect {|item| !(item.title.eql?(lastSaved.title))}
    puts itemToSave.title
  end
end