module OfferGroupHelper
  
  def offer_group_path(offer_group)
    url_for [offer_group.services.first, offer_group]
  end
  
end