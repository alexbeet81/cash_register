class Discount
  attr_accessor :product_code, :product_threshold, :discount_type, :product_price, :percentage_discount, :fixed_discount, :free_items
  
  def initialize(attributes = {})
    @product_code = attributes[:product_code]
    @product_threshold = attributes[:product_threshold]
    @discount_type = attributes[:discount_type] # Discount type = 'fixed', 'percentage'
    @product_price = attributes[:product_price]
    @percentage_discount = attributes[:percentage_discount]
    @fixed_discount = attributes[:fixed_discount]
    @free_items = attributes[:free_items]
  end

  def fixed_price_after_discount
    self.product_price - self.fixed_discount
  end

  def percentage_price_after_discount
    (self.product_price * self.percentage_discount)
  end
end