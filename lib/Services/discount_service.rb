class DiscountService
  def initialize(product, discount, checkout)
    @product = product
    @discount = discount
    @checkout = checkout
  end

  def apply_discount
    count = @checkout.basket.count { |p| p.code == product.code }
    
    if count >= discount.product_threshold
      case discount.discount_type
      when "fixed"
      when "percentage"
      when "free"
        discount.free_items do
          @checkout.scan(Product.new(product.code, product.name, 0.0))
        end
      end
    end
  end
end