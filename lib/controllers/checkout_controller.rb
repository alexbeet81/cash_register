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
      # Ask user for product code
      input = @view.get_product_code
      # Search product repo for product
      if input == "EXIT"
        break
      elsif product = @product_repository.find(input)
        # Add product to checkout.
        @checkout.scan(product)
        #display add product to basket
        #display checkout
        
      else
        # Display no product found message.
      end
    end
  end
end