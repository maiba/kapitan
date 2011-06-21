class CabinetController < ApplicationController
  add_crumb("Кабинет") { |instance| instance.send :cabinet_root_path }
  before_filter :authenticate_account!
end