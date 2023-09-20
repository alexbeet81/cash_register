class CheckoutService
  def group_and_count_products(products)
    products.each_with_object({}) do |product, sorted_basket|
      sorted_basket[product.code] ? sorted_basket[product.code][:count] += 1
                                  : sorted_basket[product.code] = { name: product.name, count: 1 }
    end
  end
end
