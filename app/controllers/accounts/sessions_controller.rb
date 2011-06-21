class Accounts::SessionsController < Devise::SessionsController

  before_filter :find_page

  def new
    add_crumb "Вход", new_account_session_path
    present(@page)
    super
  end

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => cabinet_root_path
  end


private

  def find_page
    @page = Page.where(:link_url => "/accounts/login").first
  end

end