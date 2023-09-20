class CheckoutService
  def group_and_count_products(products)
    products.each_with_object({}) do |product, sorted_basket|
      if sorted_basket[product.code]
        sorted_basket[product.code][:count] += 1
        sorted_basket[product.code][:price] += product.price
      else
        sorted_basket[product.code] = { name: product.name, count: 1, price: product.price }
      end
    end
  end
end
