class Admin::AccountsController < Admin::BaseController

  crudify :account, :xhr_paging => true, :includes => [:attachments]

  def find_account
    @account = Account.includes(:attachments).find(params[:id])
  end

end