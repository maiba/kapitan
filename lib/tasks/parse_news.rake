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
      news_item= NewsItem.new
      news_item.title =  l.call("div[@class='rt-headline']/h1[@class='rt-article-title']/a/text()")
      news_item.content = l.call("div[@class='rt-article-content']/p/text()")
      news_item.link = l.call("div[@class='rt-article-content']/p[@class='rt-readon-surround']/a/@href")
      news << news_item
    end

    news.each do |news_item|
      news_item.save if news_item.valid?
    end

  end
end