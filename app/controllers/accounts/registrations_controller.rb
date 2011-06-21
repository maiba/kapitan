class Accounts::RegistrationsController < Devise::RegistrationsController

  def new
    add_crumb "Регистрация", new_account_registration_path
    super
  end

  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up
        sign_in(resource_name, resource)
        render :js => "window.location.replace('#{cabinet_root_url}');"
        # respond_with resource, :location => redirect_location(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      render :js => "$.growl.alert('#{resource.errors.full_messages.join('. ')}');"
    end
  end

  def edit
    add_crumb "Кабинет", cabinet_root_path
    add_crumb "Редактирование профиля", edit_account_registration_path
    super
  end

  def update
    @account = current_account
    if @account.update_with_password(params[:account])
      flash[:notice] = t('devise.registrations.updated')
      render :js => "window.location.href = '#{cabinet_root_url}';"
    else
      clean_up_passwords(@account)
      render :js => "$.growl.alert('#{@account.errors.full_messages.join('. ')}');"
    end
  end

end