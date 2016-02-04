require './currency'
require './currency_converter'


usd1 = Currency.new(10, "USD")
usd2 = Currency.new(10, "YEN")

puts "#{usd1.amount} #{usd1.currency_code}"
puts "#{usd2.amount} #{usd2.currency_code}"

usd1 + usd2
