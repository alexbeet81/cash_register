require_relative '../spec_helper.rb'

describe DiscountService do
  describe "#apply_discount bogof" do
    let(:product) { instance_double("Product", code: "GR1", name: "Green Tea", price: 3.11) }
    let(:discount) { instance_double("Discount", product_code: "GR1", product_threshold: 1, discount_type: "free", free_items: 1) }
    let(:checkout) { Checkout.new }

    let(:service) { described_class.new(product, discount, checkout) }

    it "adds a free 'Green Tea' product to the basket" do
      expect(checkout.basket.products.length).to eq(0)
      checkout.scan(product)

      expect(checkout.total).to eq(3.11)

      service.apply_discount

      expect(checkout.basket.products.length).to eq(2)
      expect(checkout.total).to eq(3.11)
    end
  end
end