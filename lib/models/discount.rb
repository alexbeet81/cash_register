class Discount
  attr_accessor :product_code, :product_threshold, :discount_type, :product_price, :percentage_discount, :fixed_discount, :free_items, :apply_all
  
  def initialize(attributes = {})
    @product_code = attributes[:product_code]
    @product_threshold = attributes[:product_threshold]
    @discount_type = attributes[:discount_type] # Discount type = 'fixed', 'percentage'
    @product_price = attributes[:product_price]
    @percentage_discount = attributes[:percentage_discount]
    @fixed_discount = attributes[:fixed_discount]
    @free_items = attributes[:free_items]
    @apply_all = attributes[:apply_all]
  end
end