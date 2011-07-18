module Admin
  class OffersController < Admin::BaseController

    crudify :offer, :xhr_paging => true, :include => [:offer_groups]

  end
end
