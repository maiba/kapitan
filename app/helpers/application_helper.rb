module ApplicationHelper

  def price_formatter(price)
    sprintf("%.2f", price)
  end

 def sortable(column, title = nil)
    title ||= Order.human_attribute_name(column)
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_direction && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

end
