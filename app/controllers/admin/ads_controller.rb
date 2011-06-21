module Admin
  class AdsController < Admin::BaseController

    crudify :ad, :xhr_paging => true

  end
end
