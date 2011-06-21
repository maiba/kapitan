class AccountAttachmentsController < ApplicationController
  before_filter :authenticate_account!, :only => [:destroy, :create, :show]
  before_filter :find_page

  def index
    add_crumb "Кабинет", cabinet_root_path if account_signed_in?
    add_crumb "Загрузка файлов", account_attachments_path
    present(@page)
  end

  def create
    @attachment = current_account.attachments.build(params[:account_attachment])
    if @attachment.save
      flash[:notice] = 'Файл успешно загружен'
      redirect_to :action => :index
    else
      flash[:alert] = @attachment.errors.full_messages.join('/n')
      redirect_to :action => :index
    end
  end

  def show
    file = current_account.attachments.find(params[:id])
    send_file(File.join(Rails.root, 'public', file.resource.url(nil,false)))
  end

  def destroy
    current_account.attachments.find(params[:id]).destroy
    flash[:notice] = 'Файл успешно удален'
    redirect_to :action => :index
  end


private

  def find_page
    @page = Page.where(:link_url => "/account_attachments").first
  end

end
