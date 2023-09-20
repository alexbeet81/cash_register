require_relative '../lib/controllers/checkout_controller'
require_relative '../lib/repositories/product_repository'
require_relative '../lib/models/product'
require_relative '../lib/models/checkout'
require_relative '../lib/models/basket'
require_relative '../lib/views/checkout_view'

describe CheckoutController do
  let(:product_repository) { instance_double("ProductRepository") }
  let(:checkout_view) { instance_double("CheckoutView", display_products: nil) }
  let(:products) { [double("Product1"), double("Product2")] }
  let(:controller) { described_class.new(product_repository) }
  
  before do
    allow(CheckoutView).to receive(:new).and_return(checkout_view)
    allow(checkout_view).to receive(:get_product_code).and_return(input)
    allow(product_repository).to receive(:all).and_return(products)
  end

  describe "#run" do
    context "When input is 'EXIT'" do
      let(:input) { "EXIT" }

      it "exits" do
        controller.run
        expect(checkout_view).to have_received(:display_products).with(products)
      end
    end

    context "When input is 'exit'" do
      let(:input) { "EXIT" }
      
      it "exits" do
        controller.run
        expect(checkout_view).to have_received(:display_products).with(products)
      end 
    end
  end
end