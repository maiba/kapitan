module Admin
  class NewsItemsController < Admin::BaseController

    crudify :news_item, :xhr_paging => true

    def parse_news
       system "/usr/bin/rake parse:news --trace 2>&1 >> /log/rake.log &"
       flash[:notice] = 'Мы запустили парсер.'
       redirect_to admin_news_items_url
    end

  end
end
