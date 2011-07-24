module CartHelper

  include ActionView::Helpers
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::TagHelper

  def cart_items
    return 'Корзина пуста' if cart.empty?
    cart_form = cart.items.map{|item|
      { 
        :id => item[:id],
        :title => cart.item_title(item),
        :price => cart.item_price(item),
        :type => item[:type]
      }
    }.inject(%|<h4>Вы выбрали:</h4>|){|out, cart_item|
      out << <<-HTML
        <div class="item" data-id="#{cart_item[:id]}" data-type="#{cart_item[:type]}">
          <a href="/cart/#{cart_item[:id]}?type=#{cart_item[:type]}" data-method="delete" data-remote="true" data-type="script" class="delete" data-confirm="Удалить товар из корзины?"></a>
          <span class="price">#{cart_item[:price]} грн.</span>
          <span class="title">#{cart_item[:title]}</span>
          <div class="clearfix"></div>
        </div>
      HTML
    } << <<-HTML
      <div class="cart-price">Сумма: #{cart.total_price} грн.</div>
      <div class="order-button">Заказать</div>
      <div class="clearfix"></div>
    HTML
    cart_form.html_safe
  end

  def cart_items_inspect
    cart.items.inspect
  end

end