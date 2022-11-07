require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'

require_relative 'lib/product_collection'
require_relative 'lib/shopping_cart'

products = ProductCollection.from_dir("#{File.dirname(__FILE__)}/data").to_a
cart = ShoppingCart.new

user_choice = -1

until user_choice.zero?
  puts 'Что хотите купить:'
  products.each_with_index do |product, number|
    print "#{number + 1}. "
    product.to_s
  end
  puts '0. Выход'

  user_choice = $stdin.gets.to_i

  next unless user_choice.positive? && user_choice <= products.count && products[user_choice - 1].amount.positive?

  print 'Вы выбрали: '
  cart.add_to_cart(products[user_choice - 1])
  puts "Всего товаров на сумму: #{cart.total_price}"
  puts
end

puts 'Вы купили:'
cart.display_cart
puts "С Вас — #{cart.total_price} руб. Спасибо за покупки!"
