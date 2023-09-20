class Checkout
  def initialize
    @basket = Basket.new
  end

  def scan(product)
    @basket.add(product)
  end

  def total
    total = 0.0

    @basket.products.each { |product| total += product.price }

    total.round(2)
  end
end