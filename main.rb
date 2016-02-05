require './currency'
require './currency_converter'


usd1 = Currency.new(1, :USD)
usd2 = Currency.new(20, :USD)
usd3 = Currency.new(10, :USD)
yen1 = Currency.new(10, :JPN)
eur1 = Currency.new(1, :EUR)

currency_rates = {USD: 1.0,
                  EUR: 0.74,
                  GBP: 0.68,
                  INR: 67.54,
                  AUD: 1.39,
                  CAD: 1.37,
                  ZAR: 15.89,
                  NZD: 1.49,
                  JPY: 120.0}

# puts "#{usd1.amount} #{usd1.currency_code}"
# puts "#{usd2.amount} #{usd2.currency_code}"
#
# puts usd1 == usd3
# puts usd2 == usd3
#
# usd1 - usd2
# usd1 + usd3
# puts usd1.amount * 2.5
#
# usd4 = usd1 * 4.5
# puts usd4.amount
# puts usd4.currency_code

currency_converter = CurrencyConverter.new(currency_rates)

converted_currency = currency_converter.convert(Currency.new(1, :USD), :EUR)
puts "#{converted_currency.amount} #{converted_currency.currency_code}"

converted_currency = currency_converter.convert(Currency.new(1, :EUR), :JPY)
puts "#{converted_currency.amount} #{converted_currency.currency_code}"

converted_currency = currency_converter.convert(Currency.new(1, :EUR), :RAF)
puts "#{converted_currency.amount} #{converted_currency.currency_code}"
