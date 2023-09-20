class CheckoutView
  def display_products(products)
    puts "******* MENU *******".center(56)
    separator
    puts "| Product Code | Name".ljust(37) + " |  Price  |"
    separator
    products.each do |product|
      formatted_price = "#{product.price.round(2)}€".rjust(7) # assuming price will not exceed 9999.99€
      puts "| #{product.code.ljust(12)} | #{product.name.ljust(20)} | #{formatted_price} |"
      separator
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

  def display_checkout(basket)  
    puts "******* CHECKOUT *******".center(56)
    if basket.empty?
      separator
      puts "| YOUR BASKET IS EMPTY".center(56) + " |"
      separator
    else
      separator
      basket.each do |key, value|
        formatted_price = "#{value[:price].round(2)}€".rjust(7)
        puts "| #{key.ljust(4)} | #{value[:name].ljust(30)} X #{value[:count].to_s.ljust(3)} | #{formatted_price} |"
        separator
      end
    end
  end

  def display_total(total)
    puts "*** TOTAL ***".center(56)
    puts "|    #{total.round(2)}€     |".center(56)
    puts "*************".center(56)
  end

  def separator
    puts "-" * 56
  end
end