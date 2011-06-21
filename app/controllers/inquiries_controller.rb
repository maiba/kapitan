class InquiriesController < ApplicationController

  before_filter :find_page, :only => [:create, :new]

  def thank_you
    @page = Page.find_by_link_url("/contact/thank_you", :include => [:parts, :slugs])
  end

  def new
    @inquiry = Inquiry.new
    add_crumb @page.title, @page.link_url
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    if @inquiry.save
      if @inquiry.ham?
        begin
          InquiryMailer.notification(@inquiry, request).deliver
        rescue
          logger.warn "There was an error delivering an inquiry notification.\n#{$!}\n"
        end

        begin
          InquiryMailer.confirmation(@inquiry, request).deliver
        rescue
          logger.warn "There was an error delivering an inquiry confirmation:\n#{$!}\n"
        end
      end

      render :js => "$('#new_inquiry').resetForm(); $.growl.notice('Ваше сообщение успешно отправленно');"
    else
      render :js => "$.growl.alert('#{@inquiry.errors.full_messages.join('. ')}');"
    end
  end

protected

  def find_page
    @page = Page.find_by_link_url('/contact', :include => [:parts, :slugs])
  end

end