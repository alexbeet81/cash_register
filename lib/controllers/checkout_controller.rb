class CheckoutController
  def initialize(product_repository, discount_repository)
    @product_repository = product_repository
    @discount_repository = discount_repository
    @products = @product_repository.all
    @checkout = Checkout.new
    @view = CheckoutView.new
  end

  def run
    loop do
      # Display products to user
      @view.display_products(@products)
      #display checkout
      @view.display_checkout(@checkout.basket)

      @view.display_total(@checkout.total)

      # Ask user for product code
      input = @view.get_product_code
      # Search product repo for product
      if input == "EXIT"
        break
      elsif product = @product_repository.find(input)
        # Add product to checkout.
        @checkout.scan(product)
        #display confirmation message
        # Add discount
        apply_discount(product.code)
        @view.confirmation_message(product)
      else
        # Display no product found message.
        @view.product_not_recognised(input)
      end
    end
  end

  def apply_discount(product_code)
    # Find correct discount
    @discount_repository.find(product_code)
  end
end