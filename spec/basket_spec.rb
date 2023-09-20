require_relative '../lib/models/basket'

describe Basket do
  let(:basket) { Basket.new }
  let(:product) { instance_double("Product", code: "GR1", name: "Green Tea", price: 3.11) }

  describe "#add" do
    it "adds the product to the basket" do
      expect(basket.products.length).to eq(0)

      basket.add(product)

      expect(basket.products.length).to eq(1)
      expect(basket.products).to include(product)
    end
  end
end