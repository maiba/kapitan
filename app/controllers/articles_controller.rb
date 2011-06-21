class ArticlesController < ApplicationController

  before_filter :find_all_articles
  before_filter :find_page
  before_filter :skip_bottom, :only => [:index]
  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @article in the line below:
    present(@page)
    add_crumb @page.title, @page.link_url
  end

  def show
    @article = Article.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @article in the line below:
    present(@page)
    add_crumb @page.title, @page.link_url
    add_crumb @article.title, article_path(@article)
  end

protected

  def find_all_articles
    @articles = Article.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/articles").first
  end

end
