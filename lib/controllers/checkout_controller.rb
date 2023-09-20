class CheckoutController
  def initialize(product_repository)
    @product_repository = product_repository
    @products = @product_repository.all
    @checkout = Checkout.new
    @view = CheckoutView.new
  end

  def run
    loop do
      # Display products to user
      @view.display_products(@products)
      #display checkout

      # Ask user for product code
      input = @view.get_product_code
      # Search product repo for product
      if input == "EXIT"
        break
      elsif product = @product_repository.find(input)
        # Add product to checkout.
        @checkout.scan(product)
        #display confirmation message
        @view.confirmation_message(product)
      else
        # Display no product found message.
        @view.product_not_recognised(input)
      end
    end
  end
end