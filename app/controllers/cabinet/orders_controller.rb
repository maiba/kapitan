class Cabinet::OrdersController < CabinetController

  def index
    @orders = current_account.orders
  end

  def show
    @order = current_account.orders.find(params[:id])
  end

end