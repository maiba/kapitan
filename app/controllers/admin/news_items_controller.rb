module Admin
  class NewsItemsController < Admin::BaseController

    crudify :news_item, :xhr_paging => true

  end
end
