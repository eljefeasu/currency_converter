require './currency'
require './currency_converter'


usd1 = Currency.new(2, :USD)
usd2 = Currency.new(20, :USD)
usd3 = Currency.new(2, :USD)
yen1 = Currency.new(10, :JPN)
eur1 = Currency.new(1, :EUR)
usd5 = Currency.new("$5.00")
usd6 = Currency.new(5)

puts "#{usd1.amount} #{usd1.currency_code}"
puts "#{usd2.amount} #{usd2.currency_code}"
puts "#{usd3.amount} #{usd3.currency_code}"
puts "#{yen1.amount} #{yen1.currency_code}"
puts "#{eur1.amount} #{eur1.currency_code}"
puts "#{usd5.amount} #{usd5.currency_code}"
puts "#{usd6.amount} #{usd6.currency_code}"

currency_rates = {USD: 1.0,
                  EUR: 0.90,
                  GBP: 0.69,
                  INR: 67.80,
                  JPY: 116.89}

puts "#{usd1.amount} #{usd1.currency_code}"
puts "#{usd2.amount} #{usd2.currency_code}"

puts usd1 == usd3
puts usd2 == usd3

usd10 = usd1.*(20)
puts "#{usd10.amount} #{usd10.currency_code}"

usd1 + usd3
puts usd1.amount * 2.5

usd4 = usd1 * 4.5
puts usd4.amount
puts usd4.currency_code

currency_converter = CurrencyConverter.new(currency_rates)

converted_currency = currency_converter.convert(Currency.new(1, :USD), :EUR)
puts "#{converted_currency.amount} #{converted_currency.currency_code}"

converted_currency = currency_converter.convert(Currency.new(1, :EUR), :JPY)
puts "#{converted_currency.amount} #{converted_currency.currency_code}"

converted_currency = currency_converter.convert(usd1, :EUR)
puts "#{converted_currency.amount} #{converted_currency.currency_code}"
