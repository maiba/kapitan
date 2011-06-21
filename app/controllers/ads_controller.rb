class AdsController < ApplicationController

  before_filter :find_all_ads
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @ad in the line below:
    present(@page)
    redirect_to root_path
  end

  def show
    @ad = Ad.find(params[:id])
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @ad in the line below:
    present(@page)
    redirect_to root_path
  end

  def random
    if params[:side] && params[:side].any?
      ad = Ad.side(params[:side]).random
    else
      ad = Ad.random
    end
    render :json => { :src => ad.photo.thumbnail('200x300>').url, :url => ad.link }
  end


protected

  def find_all_ads
    @ads = Ad.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/ads")
  end

end
