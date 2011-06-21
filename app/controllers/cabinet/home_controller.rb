class Cabinet::HomeController < CabinetController

  def index
    @account = current_account
  end

end