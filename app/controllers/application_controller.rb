class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :add_www_subdomain
  before_filter :show_bottom

  helper_method :cart

  add_crumb "Главная", '/'

  rescue_from ActiveRecord::RecordNotFound, ActionController::UnknownAction, ActionView::MissingTemplate, :with => :error_404



private

  def add_www_subdomain
    if !(request.host =~ /^www/) && Rails.env == "production"
      redirect_to("#{request.protocol}www.kapitan.kh.ua#{request.request_uri}", :status => 301)
    end
  end

  def error_404
    render :file => Rails.root.join('public', '404.html').cleanpath.to_s, :layout => false, :status => 404
  end

  def show_bottom
    @show_bottom_part = true
  end

  def skip_bottom
    @show_bottom_part = false
  end

  def cart
    @cart ||= Cart.new(session)
  end

  def redirect_to(options = {}, response_status = {})
    if request.xhr?
      render(:update) {|page| page.redirect_to(options)}
    else
      super(options, response_status)
    end
  end

end
