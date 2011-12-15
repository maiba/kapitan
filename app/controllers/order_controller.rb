class OrderController < ApplicationController

  def create
    if account_signed_in?
      @order = Order.new(:account_id => current_account.id,
      :price => cart.total_price,
      :data => cart.items)

      if @order.save
        cart.delete_all
        redirect_to cabinet_orders_path
      else
        render :js => %|$.growl.error('Извините, не получилось. Попробуйте, пожалуйста, позднее.');|
      end
    else
      redirect_to new_account_session_path
    end
  end

end