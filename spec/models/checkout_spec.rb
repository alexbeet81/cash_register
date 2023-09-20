require_relative '../spec_helper.rb'

describe Checkout do
  let(:checkout) { Checkout.new }
  let(:basket) { checkout.basket }
  let(:product) { instance_double("Product", code: "GR1", name: "Green Tea", price: 3.11) }

  describe "#scan" do
    it "adds product to checkout basket" do
      expect(basket.products.length).to eq(0)
      checkout.scan(product)

      expect(basket.products.length).to eq(1)
      expect(basket.products).to include(product)
    end
  end

  describe "#total" do
    it "returns 0.0 when basket is empty" do
      expect(basket.products.length).to eq(0)
      expect(checkout.total).to eq(0.0)
      checkout.scan(product)

      expect(basket.products.length).to eq(1)
      expect(basket.products).to include(product)
      expect(checkout.total).to eq(3.11)
    end

    it "returns 3.11 after adding 'Green Tea'" do
      expect(basket.products.length).to eq(0)
      expect(checkout.total).to eq(0.0)
      checkout.scan(product)

      expect(basket.products.length).to eq(1)
      expect(basket.products).to include(product)
      expect(checkout.total).to eq(3.11)
    end

    it "returns 6.22 after adding 'Green Tea' twice" do
      expect(basket.products.length).to eq(0)
      expect(checkout.total).to eq(0.0)
      checkout.scan(product)
      checkout.scan(product)

      expect(basket.products.length).to eq(2)
      expect(basket.products).to include(product)
      expect(checkout.total).to eq(6.22)
    end
  end
end