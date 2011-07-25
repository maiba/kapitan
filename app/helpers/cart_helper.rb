module CartHelper

  include ApplicationHelper
  include ActionView::Helpers

  def cart_items
    return %|<div class="item">Корзина пуста</div>|.html_safe if cart.empty?
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
          <span class="price">#{price_formatter cart_item[:price]} грн.</span>
          <span class="title">#{cart_item[:title]}</span>
          <div class="clearfix"></div>
        </div>
      HTML
    } << <<-HTML
      <div class="cart-price">
        Сумма заказа:
        <span class="total-price">#{price_formatter cart.total_price}</span>
        грн.
      </div>
      <div class="order-button">Оформить заказ</div>
      <div class="clearfix"></div>
    HTML
    cart_form.html_safe
  end

end