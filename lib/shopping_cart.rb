class ShoppingCart
  def initialize
    @products = []
    @sum = 0
  end

  def add_to_cart(product)
    @products << product
    @sum += product.price
    product.amount -= 1
    product.to_s
  end

  def display_cart
    @products.each(&:to_s)
  end

  def total_price
    @sum
  end
end
