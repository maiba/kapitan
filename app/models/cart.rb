class Cart

  attr_reader :errors

  def initialize(session)
    @session = session
    @session[:cart] ||= []
  end

  def items
    @session[:cart].compact
  end

  def summ
    return nil if empty?
    products.inject(0){|result, item| result.to_f + (item[:product].price.to_f * item[:count].to_i) }
  end

  def add(item)
    return false unless valid?(item)
    delete(item) if in_cart?(item)
    if item[:type] == 'package'
      @session[:cart] << { :id => item[:id].to_i, :type => item[:type] }
    elsif item[:type] == 'properties'
      @session[:cart] << { :id => item[:id], :type => item[:type], :count => item[:count].to_i, :properties => item[:properties] }
    end
    true
  end

  def find(item)
    return nil if empty?
    @session[:cart].each{|i| return i if i[:id] == item[:id].to_i && i[:type] == item[:type] }
  end

  def item_price(item)
    if item[:type] == 'package'
      Service::Package.find(item[:id]).price
    end
  end

  def delete(item)
    return false if empty?
    @session[:cart].map!{|i| i unless i[:id].to_i == item[:id].to_i && i[:type] == item[:type] }.compact!
  end

  def delete_all
    @session[:cart] = []
  end

 def empty?
   @session[:cart].compact.empty?
 end

private

  def in_cart?(item)
    @session[:cart].each{|i| return true if i[:id].to_i == item[:id].to_i && i[:type] == item[:type] }
    false
  end

  def valid?(item)
    i18n_scope = 'cart.errors'
    @errors = []

    if item[:type] == 'package'
      @errors << I18n.t('package_not_found', :scope => i18n_scope) unless Service::Package.exists?(item[:id].to_s)
    elsif item[:type] == 'properties'
      @errors << I18.t('item_must_have_count', :scope => i18n_scope) unless item[:count] && item[:count] > 0
    else
      @errors << I18.t('item_must_have_type', :scope => i18n_scope)
    end

    # unless item[:count] || form[:count].blank?
    #   @errors << I18n.t(i18n_scope + 'count.empty')
    # else
    #   @errors << I18n.t(i18n_scope + 'count.invalid') if form[:count].to_i <= 0 || form[:count].to_i > 100
    # end
    # 
    # unless form[:id] || form[:id].blank?
    #   @errors << I18n.t(i18n_scope + 'id.empty')
    # else
    #   @errors << I18n.t(i18n_scope + 'id.not_found') unless Product.exists?(form[:id])
    # end

    return @errors.blank?
  end

end