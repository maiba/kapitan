class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :add_www_subdomain
  before_filter :show_bottom

  add_crumb "Главная", '/'

  rescue_from ActiveRecord::RecordNotFound, ActionController::UnknownAction, ActionView::MissingTemplate, :with => :error_404

private

  def add_www_subdomain
    unless /^www/.match(request.host) && !(Rails.env == "production")
      redirect_to("#{request.protocol}www.kapitan.kh.ua/#{request.request_uri}", :status => 301)
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

end
