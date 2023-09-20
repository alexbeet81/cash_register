class CheckoutController
  def initialize(product_repository)
    @product_repository = product_repository
    @products = @product_repository.all
    @checkout = Checkout.new
    @view = CheckoutView.new
  end

  def run
    @view.display_products(@products)
  end
end