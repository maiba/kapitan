class OrderController < ApplicationController

  def create
    render :js => %|$.growl.alert('Авторизируйтесь пожалуйста');|
  end

end