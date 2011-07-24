module CartHelper

  include ActionView::Helpers
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::TagHelper

  def cart_items
    return 'Корзина пуста' if cart.empty?
    cart.items.map do |item|
      if item[:type] == 'package'
        package = Service::Package.find(item[:id])
        { :id => item[:id], :title => package.title, :price => cart.item_price(item), :type => item[:type] }
      elsif item[:type] == 'properties'
        [t,0]
      end
    end.inject %|<h4>Вы выбрали:</h4>| do |out, cart_item|
      out << <<-HTML
        <div class="item" data-id="#{cart_item[:id]}" data-type="#{cart_item[:type]}">
          <a href="/cart/#{cart_item[:id]}?type=#{cart_item[:type]}" data-method="delete" data-remote="true" data-type="script" class="delete" data-confirm="Удалить товар из корзины?"></a>
          <span class="price">#{cart_item[:price]} грн.</span>
          <span class="title">#{cart_item[:title]}</span>
        </div>
      HTML
    end.html_safe
  end

  def cart_items_inspect
    cart.items.inspect
  end

end