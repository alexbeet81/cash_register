class CheckoutController
  def initialize(product_repository)
    @product_repository = product_repository
    @checkout = Checkout.new
  end

  def run
  end
end