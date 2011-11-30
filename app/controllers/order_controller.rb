class OrderController < ApplicationController

  def create
    if account_signed_in?
      @order = Order.new(:account_id => current_account.id,
      :price => cart.total_price,
      :data => cart.items)

      if @order.save
        cart.delete_all
        render :js => %|$.growl.notice('Спасибо за заказ.');|
      else
        render :js => %|$.growl.error('Извините, не получилось. Попробуйте, пожалуйста, позднее.');|
      end
    else
      render :js => %|$.growl.alert('Пожалуйста, авторизуйтесь.');|
    end
  end

end