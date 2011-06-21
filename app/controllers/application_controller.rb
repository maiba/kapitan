class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :show_bottom

  add_crumb "Главная", '/'


private

  def show_bottom
    @show_bottom_part = true
  end

  def skip_bottom
    @show_bottom_part = false
  end


end
