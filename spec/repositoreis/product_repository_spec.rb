require_relative '../spec_helper.rb'

describe ProductRepository do  
  let(:product_repository) { described_class.new }

  describe '#find' do
    it "finds the correct product" do
      product = product_repository.find("GR1")
  
      expect(product.name).to eq("Green Tea")
    end

    it "returns nil when it can't find product" do
      product = product_repository.find("NA")
  
      expect(product).to eq(nil)
    end
  end
end