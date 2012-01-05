class Service::OfferGroupsController < ServicesController

  prepend_before_filter :find_offer_group, :only => [:show]

  def properties
    render :json => Offer::Type.find(params[:id]).offer_properties.to_json(:only => [ :id, :title ],
     :include => { :offer_property_options => { :only => [:id, :title, :price]},
                    :offer_type_property_discounts => { :only => [:id, :limit, :percent] }})
  end

  def type
    render :json => Offer::Type.find(params[:id]).to_json(:only => [ :description, :pic ])
  end

private

  def find_offer_group
    @offer_group = Offer::Group.find(params[:id])
  end

  def render_crumb
    super
    add_crumb @offer_group.title, service_offer_group_path(@service, @offer_group)
  end



end
