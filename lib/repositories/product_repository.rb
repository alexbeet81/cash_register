class ProductRepository
  def initialize
    @products = {
      GR1: new_product("GR1", "Green Tea", 3.11),
      SR1: new_product("SR1", "Strawberries", 5.00),
      CF1: new_product("CF1", "Coffee", 11.23)
    }
  end

  def new_product(code, name, price)
    Product.new(code, name, price)
  end

  def find(code)
    @products[code.to_sym]
  end

  def all
    @products.values
  end
end