class CartController < ApplicationController

  include CartHelper

  def create
    if cart.add(params[:item])
      notice = 'Товар добавлен в корзину'
      render :js => <<-SCRIPT
        $.growl.notice('#{notice}');
        $("#cart .items").html("#{escape_javascript(cart_items)}");
      SCRIPT
    else
      render :js => %| $.growl.alert('#{cart.errors.join(' ')}'); |
    end
  end

  def destroy
    cart.delete({ :id => params[:id], :type => params[:type] })
    js = if cart.empty?
      <<-SCRIPT
        $.growl.notice('Корзина пуста');
        $("#cart .items").html("#{escape_javascript(cart_items)}");
      SCRIPT
    else
      <<-SCRIPT
        $.growl.notice('Товар удален');
        $("#cart .item[data-id='#{params[:id]}'][data-type='#{params[:type]}']").slideUp(300,function(){
          $(this).remove();
          $("#cart .total-price").html("#{price_formatter cart.total_price}");
        });
      SCRIPT
    end
    render :js => js
  end

end