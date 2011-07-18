class CalculatorController < ApplicationController

  def index
    @page = Page.find_by_link_url("/calculator")
  end

  def offers
    offers = Offer::Group.find(params[:id]).offers
    render :json => offers
  end

end