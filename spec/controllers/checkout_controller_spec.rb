require_relative '../spec_helper.rb'

describe CheckoutController do
  let(:product_repository) { instance_double("ProductRepository") }
  let(:discount_repository) { instance_double("DiscountRepository") }
  let(:checkout_view) { instance_double("CheckoutView", display_products: nil) }

  let(:green_tea) { Product.new('GR1', 'Green Tea', 3.11) }
  let(:straberries) { Product.new('SR1', 'Strawberries', 5.00) }
  let(:coffee) { Product.new('CF1', 'Coffee', 11.23) }

  let(:products) { [green_tea, straberries, coffee] }
  let(:controller) { described_class.new(product_repository, discount_repository) }
  
  before do
    allow(CheckoutView).to receive(:new).and_return(checkout_view)
    allow(checkout_view).to receive(:get_product_code).and_return(input)
    allow(checkout_view).to receive(:display_checkout)
    allow(checkout_view).to receive(:display_total)
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
  end
end