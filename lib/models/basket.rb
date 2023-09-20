class Basket
  attr_accessor :products
  
  def initialize
    @products = []
  end

  def add(product)
    @products << product
  end
end