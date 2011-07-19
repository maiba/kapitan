class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :show_bottom

  add_crumb "Главная", '/'

  rescue_from ActiveRecord::RecordNotFound, ActionController::UnknownAction, ActionView::MissingTemplate, :with => :error_404

private

  def error_404
    render :file => Rails.root.join('public', '404.html').cleanpath.to_s,
           :layout => false,
           :status => 404
  end

  def show_bottom
    @show_bottom_part = true
  end

  def skip_bottom
    @show_bottom_part = false
  end


end
