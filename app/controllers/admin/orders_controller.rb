module Admin
  class OrdersController < Admin::BaseController

    crudify :order, :xhr_paging => true

  end
end
