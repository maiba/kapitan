module ApplicationHelper

  def price_formatter(price)
    sprintf("%.2f", price)
  end

end
