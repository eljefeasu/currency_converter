require './currency'
require './currency_converter'


usd1 = Currency.new(10, "USD")
usd2 = Currency.new(20, "USD")
usd3 = Currency.new(10, "USD")
yen1 = Currency.new(10, "YEN")

puts "#{usd1.amount} #{usd1.currency_code}"
puts "#{usd2.amount} #{usd2.currency_code}"

usd1 - usd2
usd1 - usd3
usd1 - yen1
