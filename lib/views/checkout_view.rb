class CheckoutView
  def display_products(products)
    puts "\n| Product Code | Name | Price |"
    products.each do |product|
      puts "| #{product.code} | #{product.name} | #{product.price} |"
    end
  end

  def get_product_code
    puts "\nEnter the code to add the product to your basket, or type 'exit' to quit:"
    gets.chomp.upcase
  end

  def confirmation_message(product)
    puts "\nYou have added #{product.name} to your basket"
  end

  def product_not_recognised(input)
    puts "\nSorry, we can't find a product with code '#{input}'. Please try again."
  end
end