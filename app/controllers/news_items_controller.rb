class NewsItemsController < ApplicationController

  before_filter :find_all_news_items
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @news_item in the line below:
    present(@page)
    add_crumb @page.title, @page.link_url
  end

  def show
    @news_item = NewsItem.find(params[:id])
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @news_item in the line below:
    present(@page)
    add_crumb @page.title, @page.link_url
    add_crumb @news_item.title, news_item_path(@news_item)
  end

protected

  def find_all_news_items
    @news_items = NewsItem.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/news")
  end

end
