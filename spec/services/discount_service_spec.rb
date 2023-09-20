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

  describe "#apply_discount percentage" do
    let(:product) { Product.new("CF1", "Coffee", 11.23) }
    let(:discount) { Discount.new(product_code: "CF1", product_threshold: 3, discount_type: "percentage", product_price: 11.23, percentage_discount: (2.0 / 3.0))}
    let(:checkout) { Checkout.new }

    let(:service) { described_class.new(product, discount, checkout) }

    it "applys the correct discount after the threshold has been reached" do
      expect(checkout.basket.products.length).to eq(0)
      expect(product.price).to eq(11.23)

      3.times do
        checkout.scan(product)
      end

      service.apply_discount
      expect(product.price.round(2)).to eq(7.49)
      expect(checkout.basket.products.length).to eq(3)
      expect(checkout.total).to eq(22.46)
    end

    it "doesn't apply the discount before the threshold has been reached" do
      expect(checkout.basket.products.length).to eq(0)
      expect(product.price).to eq(11.23)

      2.times do
        checkout.scan(product)
      end

      service.apply_discount
      expect(product.price).to eq(11.23)
      expect(checkout.basket.products.length).to eq(2)
      expect(checkout.total).to eq(22.46)
    end
  end

  describe "#apply_discount multiple" do
    let(:checkout) { Checkout.new }
    # Green Tea
    let(:gr1_product) { Product.new("GR1", "Green Tea", 3.11) }
    let(:gr1_discount) { instance_double("Discount", product_code: "GR1", product_threshold: 1, discount_type: "free", free_items: 1) }
    let(:gr1_service) { described_class.new(gr1_product, gr1_discount, checkout) }

    # Strawberries
    let(:sr1_product) { Product.new("SR1", "Strawberries", 5.00) }
    let(:sr1_discount) { Discount.new(product_code: "SR1", product_threshold: 3, discount_type: "fixed", product_price: 5.00, fixed_discount: 0.5)}
    let(:sr1_service) { described_class.new(sr1_product, sr1_discount, checkout) }

    # Coffee
    let(:cf1_product) { Product.new("CF1", "Coffee", 11.23) }
    let(:cf1_discount) { Discount.new(product_code: "CF1", product_threshold: 3, discount_type: "percentage", product_price: 11.23, percentage_discount: (2.0 / 3.0))}
    let(:cf1_service) { described_class.new(cf1_product, cf1_discount, checkout) }

    it "adds GR1,GR1 with a total of 3.11" do
      expect(checkout.basket.products.length).to eq(0)
      expect(checkout.total).to eq(0.0)

      checkout.scan(gr1_product)
      gr1_service.apply_discount

      expect(checkout.basket.products.length).to eq(2)
      expect(count_products(checkout.basket, gr1_product.code)).to eq(2)
      expect(checkout.total).to eq(3.11)
    end

    it "adds SR1,SR1,GR1,SR1 with a total of 16.61" do
      expect(checkout.basket.products.length).to eq(0)
      expect(checkout.total).to eq(0.0)

      # SR1
      checkout.scan(sr1_product)
      sr1_service.apply_discount
      # SR1
      checkout.scan(sr1_product)
      sr1_service.apply_discount
      # GR1
      checkout.scan(gr1_product)
      gr1_service.apply_discount
      # SR1
      checkout.scan(sr1_product)
      sr1_service.apply_discount

      expect(checkout.basket.products.length).to eq(5)
      expect(count_products(checkout.basket, gr1_product.code)).to eq(2)
      expect(count_products(checkout.basket, sr1_product.code)).to eq(3)

      expect(checkout.total).to eq(16.61)
    end

    it "adds GR1,CF1,SR1,CF1,CF1  with a total of 30.57" do
      expect(checkout.basket.products.length).to eq(0)
      expect(checkout.total).to eq(0.0)

      # GR1
      checkout.scan(gr1_product)
      gr1_service.apply_discount
      # CF1
      checkout.scan(cf1_product)
      cf1_service.apply_discount
      # SR1
      checkout.scan(sr1_product)
      sr1_service.apply_discount
      # CF1
      checkout.scan(cf1_product)
      cf1_service.apply_discount
      # CF1
      checkout.scan(cf1_product)
      cf1_service.apply_discount


      expect(checkout.basket.products.length).to eq(6)
      expect(count_products(checkout.basket, gr1_product.code)).to eq(2)
      expect(count_products(checkout.basket, sr1_product.code)).to eq(1)
      expect(count_products(checkout.basket, cf1_product.code)).to eq(3)

      expect(checkout.total).to eq(30.57)
    end
  end
end