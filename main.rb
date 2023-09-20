require_relative "lib/controllers/checkout_controller"
require_relative "lib/models/product"
require_relative "lib/models/checkout"
require_relative "lib/models/basket"
require_relative "lib/views/checkout_view"
require_relative "lib/repositories/product_repository"

product_repository = ProductRepository.new
checkout_controller = CheckoutController.new(product_repository)

checkout_controller.run