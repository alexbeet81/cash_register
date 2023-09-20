class DiscountRepository
  def initialize
    @discounts = {
      GR1: Discount.new(product_code: "GR1", product_threshold: 1, discount_type: "free", free_items: 1),
      SR1: Discount.new(product_code: "SR1", product_threshold: 3, discount_type: "fixed", product_price: 5.00, fixed_discount: 0.5, apply_all: true),
      CF1: Discount.new(product_code: "CF1", product_threshold: 3, discount_type: "percentage", product_price: 11.23, percentage_discount: (2.0 / 3.0), apply_all: true)
    }
  end

  def find(code)
    @discounts[code.upcase.to_sym]
  end
end