class ProductRepository
  def initialize
    @products = {
      GR1: Product.new("GR1", "Green Tea", 3.11),
      SR1: Product.new("SR1", "Strawberries", 5.00),
      CF1: Product.new("CF1", "Coffee", 11.23)
    }
  end

  def find(code)
    @products[code]
  end

  def all
    @products.values
  end
end