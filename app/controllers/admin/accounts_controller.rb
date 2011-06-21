class Admin::AccountsController < Admin::BaseController

  crudify :account, :xhr_paging => true, :include => [:attachments]

  def find_account
    @account = Account.includes(:attachments).find(params[:id])
  end

end