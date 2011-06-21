class Service::OfferGroupsController < ServicesController

  prepend_before_filter :find_offer_group, :only => [:show]

private

  def find_offer_group
    @offer_group = Offer::Group.find(params[:id])
  end

  def render_crumb
    super
    add_crumb @offer_group.title, service_offer_group_path(@service, @offer_group)
  end

end
