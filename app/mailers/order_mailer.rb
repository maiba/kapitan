class OrderMailer < ActionMailer::Base

  default :from => "\"#{RefinerySetting[:site_name]}\" <noreply@kapitan.ua>"

  def confirmation(order, request)
    @host = default_url_options[:host] = url_prefix(request)
    @order = order
    mail(
      :to       => order.email,
      :subject  => RefinerySetting.find_or_set(:order_confirmation_subject, "Подтверждение заказа"),
      :reply_to => RefinerySetting.find_or_set(:order_reply_to, "admin@kapitan.kh.ua")
    )
  end

  def notification(order, request)
    @host = default_url_options[:host] = url_prefix(request)
    default_url_options[:host] = request.host_with_port
    @order = order
    mail(
      :to       => RefinerySetting.find_or_set(:order_notification_recipient, "zakaz@kapitan.kh.ua"),
      :subject  => RefinerySetting.find_or_set(:order_notification_subject, "Новый заказ")
    )
  end


protected

  def url_prefix(request)
    "#{request.protocol}#{request.host_with_port}"
  end

end
