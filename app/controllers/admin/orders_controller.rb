module Admin
  class OrdersController < Admin::BaseController

    helper_method :sort_column, :sort_direction

    crudify :order, :xhr_paging => true

    def index
      @orders = Order.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page])
    end

    private
     def sort_column
       Order.column_names.include?(params[:sort]) ? params[:sort] : "status"
     end

     def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end

  end
end
