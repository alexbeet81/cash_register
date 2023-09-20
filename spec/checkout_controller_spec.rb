require_relative '../lib/controllers/checkout_controller'
require_relative '../lib/repositories/product_repository'
require_relative '../lib/models/product'
require_relative '../lib/models/checkout'
require_relative '../lib/models/basket'
require_relative '../lib/views/checkout_view'

describe CheckoutController do
  let(:product_repository) { ProductRepository.new }
  let(:controller) { described_class.new(product_repository) }

  describe "run" do
    it "displays the products using checkout view" do
      controller.run
    end
  end
end
