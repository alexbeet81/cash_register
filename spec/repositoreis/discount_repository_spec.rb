require_relative '../spec_helper.rb'

describe DiscountRepository do

  describe "#find" do
    let(:discount_repository) { described_class.new }
    let(:product_code) { "GR1" }

    it "returns the correct discount" do

      discount = discount_repository.find(product_code)
      expect(discount.product_threshold).to eq(1)
      expect(discount.discount_type).to eq("free")
      expect(discount.free_items).to eq(1)
    end

    it "returns nil when no discount" do
      product_code = "FOO"

      discount = discount_repository.find(product_code)
      expect(discount).to eq(nil)
    end
  end
end