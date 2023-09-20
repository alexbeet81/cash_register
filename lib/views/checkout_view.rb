class CheckoutView
  def display_products(products)
    puts "\n| Product Code | Name | Price |"
    products.each do |product|
      puts "| #{product.code} | #{product.name} | #{product.price} |"
    end
  end
end