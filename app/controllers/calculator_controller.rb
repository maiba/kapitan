class CalculatorController < ApplicationController

  before_filter :skip_bottom

  def index
    @page = Page.find_by_link_url("/calculator")
    add_crumb @page.title, calculator_path
  end

  def offers
    render :json => Offer::Group.find(params[:id]).offers.to_json(:only => [ :id, :title ])
  end

  def properties
    render :json => Offer.find(params[:id]).offer_properties.to_json(:only => [ :id, :title ], :include => { :offer_property_options => { :only => [:id, :title, :price] } })
  end

end