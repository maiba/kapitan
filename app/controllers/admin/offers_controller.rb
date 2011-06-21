module Admin
  class OffersController < Admin::BaseController

    crudify :offer, :xhr_paging => true

  end
end
