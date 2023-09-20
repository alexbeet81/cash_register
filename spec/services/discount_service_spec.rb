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

  describe "#apply_discount fixed" do
    let(:product) { Product.new("SR1", "Strawberries", 5.00) }
    let(:discount) { Discount.new(product_code: "SR1", product_threshold: 3, discount_type: "fixed", product_price: 5.00, fixed_discount: 0.5)}
    let(:checkout) { Checkout.new }

    let(:service) { described_class.new(product, discount, checkout) }

    it "applys the correct discount after the threshold has been reached" do
      expect(checkout.basket.products.length).to eq(0)
      expect(product.price).to eq(5.00)

      3.times do
        checkout.scan(product)
      end

      service.apply_discount
      expect(product.price).to eq(4.50)
      expect(checkout.basket.products.length).to eq(3)
      expect(checkout.total).to eq(13.50)
    end

    it "doesn't apply the discount before the threshold has been reached" do
      expect(checkout.basket.products.length).to eq(0)
      expect(product.price).to eq(5.00)

      2.times do
        checkout.scan(product)
      end

      service.apply_discount
      expect(product.price).to eq(5.00)
      expect(checkout.basket.products.length).to eq(2)
      expect(checkout.total).to eq(10.00)
    end
  end
end