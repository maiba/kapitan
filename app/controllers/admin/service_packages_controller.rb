module Admin
  class ServicePackagesController < Admin::BaseController

    crudify "service/package", :xhr_paging => true, :class_name => 'Service::Package', :singular_name => "service_package", :plural_name => "service_packages"

  end
end
