require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'

require_relative 'lib/product_collection'

products = ProductCollection.from_dir("#{File.dirname(__FILE__)}/data")

user_choice = -1
choice_products = []
sum = 0

until user_choice.zero?
  puts 'Что хотите купить:'
  products.to_a.each_with_index do |product, number|
    print "#{number + 1}. "
    product.to_s
  end
  puts '0. Выход'

  user_choice = gets.chomp.to_i

  unless user_choice.positive? && user_choice <= products.to_a.count && products.to_a[user_choice - 1].amount.positive?
    next
  end

  print 'Вы выбрали: '
  products.to_a[user_choice - 1].amount -= 1
  products.to_a[user_choice - 1].to_s
  choice_products << products.to_a[user_choice - 1]
  sum += products.to_a[user_choice - 1].price
  puts "Всего товаров на сумму: #{sum}"
  puts
end

puts 'Вы купили:'
choice_products.each(&:to_s)
puts "С Вас — #{sum} руб. Спасибо за покупки!"
