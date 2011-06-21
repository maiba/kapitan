module Admin
  class OfferGroupsController < Admin::BaseController

    crudify "offer/group", :xhr_paging => true, :class_name => 'Offer::Group', :singular_name => "offer_group", :plural_name => "offer_groups"

    def update
      if @offer_group.update_attributes(params[:offer_group])
        (request.xhr? ? flash.now : flash).notice = t(
          'refinery.crudify.updated',
          :what => @offer_group.title
        )

        unless from_dialog?
          unless params[:continue_editing] =~ /true|on|1/
            redirect_back_or_default(admin_offer_groups_url)
          else
            unless request.xhr?
              redirect_to :back
            else
              render :partial => "/shared/message"
            end
          end
        else
          render :text => "<script>parent.window.location = '#{admin_offer_groups_url}';</script>"
        end
      else
        unless request.xhr?
          render :action => 'edit'
        else
          render :partial => "/shared/admin/error_messages",
                 :locals => {
                   :object => @offer_group,
                   :include_object_name => true
                 }
        end
      end
    end

  end
end
