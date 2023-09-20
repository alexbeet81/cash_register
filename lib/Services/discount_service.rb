class DiscountService
  def initialize(product, discount, checkout)
    @product = product
    @discount = discount
    @checkout = checkout
  end

  def apply_discount
    count = @checkout.basket.products.count { |p| p.code == @product.code }

    if count >= @discount.product_threshold
      case @discount.discount_type
      when "fixed", "percentage"
          @checkout.basket.products.each { |p| p.price = @discount.send("#{@discount.discount_type}_price_after_discount") if p.code == @discount.product_code }
      when "free"
        @discount.free_items.times do
          @checkout.scan(Product.new(@product.code, @product.name, 0.0))
        end
      end
    end
  end
end