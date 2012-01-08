class Cabinet::OrdersController < CabinetController
  
  helper_method :sort_column, :sort_direction

  def index
    @orders = current_account.orders.order(sort_column + ' ' + sort_direction)
  end

  def show
    @order = current_account.orders.find(params[:id])
  end

   private
     def sort_column
       Order.column_names.include?(params[:sort]) ? params[:sort] : "status"
     end

     def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end

end