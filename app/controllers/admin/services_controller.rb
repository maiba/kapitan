module Admin
  class ServicesController < Admin::BaseController

    crudify :service, :order => 'lft ASC', :conditions => {:parent_id => nil}, :sortable => true

  end
end
