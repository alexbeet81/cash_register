require_relative '../lib/controllers/checkout_controller'
require_relative '../lib/repositories/product_repository'
require_relative '../lib/repositories/discount_repository'
require_relative '../lib/models/product'
require_relative '../lib/models/checkout'
require_relative '../lib/models/basket'
require_relative '../lib/models/discount'
require_relative '../lib/views/checkout_view'
require_relative '../lib/services/discount_service'
require_relative '../lib/services/checkout_serivce'

def count_products(basket, code)
  basket.products.count { | product | product.code == code }
end