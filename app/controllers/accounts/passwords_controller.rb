class Accounts::PasswordsController < Devise::PasswordsController

  def new
    add_crumb "Восстановление пароля", new_account_password_path
    super
  end

end
