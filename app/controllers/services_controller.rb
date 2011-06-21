class ServicesController < ApplicationController

  before_filter :find_all_services, :only => [:index]
  before_filter :find_page, :only => [:index, :show]
  before_filter :find_service, :only => [:show]
  before_filter :render_crumb, :only => [:show]
  before_filter :skip_bottom

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @service in the line below:
    present(@page)
    add_crumb @page.title, @page.link_url
  end

  def show
    present(@page)
  end

protected

  def find_service
    @service = Service.find(params[:service_id] || params[:id])
  end

  def render_crumb
    add_crumb @page.title, @page.link_url
    add_crumb @service.title, service_path(@service)
  end

  def find_all_services
    @services = Service.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/services").first
  end

end
