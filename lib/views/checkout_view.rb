class CheckoutView
  def display_products(products)
    puts "\n| Product Code | Name | Price |"
    products.each do |product|
      puts "| #{product.code} | #{product.name} | #{product.price} |"
    end
  end

  def get_product_code
    puts "\n Enter the code to add the product to your basket, or type 'exit' to quit:"
    gets.chomp.upcase
  end
end