require './currency'
require './currency_converter'
require './currency_trader'


usd1 = Currency.new(2, :USD)
usd2 = Currency.new(20, :USD)
usd3 = Currency.new(2, :USD)
yen1 = Currency.new(10, :JPN)
eur1 = Currency.new(1, :EUR)
usd5 = Currency.new("$5.00")
usd6 = Currency.new(5)
usd_hard = "$1000000"
eur_hard = "€1000000"

currency_rates_feb15 = {USD: 1.0,
                        EUR: 0.88,
                        GBP: 0.66,
                        INR: 62.05,
                        JPY: 119.16}

currency_rates_feb16 = {USD: 1.0,
                        EUR: 0.90,
                        GBP: 0.69,
                        INR: 67.80,
                        JPY: 116.89}

print "The following are evidence of working currency objects,\nincluding turning $5.00 into 5 USD:\n"

puts "usd1: #{usd1.amount} #{usd1.currency_code}"
puts "usd2: #{usd2.amount} #{usd2.currency_code}"
puts "usd3: #{usd3.amount} #{usd3.currency_code}"
puts "usd4: #{yen1.amount} #{yen1.currency_code}"
puts "eur1: #{eur1.amount} #{eur1.currency_code}"
puts "usd5: #{usd5.amount} #{usd5.currency_code}"
puts "usd6: #{usd6.amount} #{usd6.currency_code}"

print "\nDoes usd1 == usd3?: "
puts usd1 == usd3
print "Does usd2 == usd3?: "
puts usd2 == usd3

puts "\nMultiply usd1 * 20 and return currency object. Display object:"
usd10 = usd1.*(20)
puts usd10
puts "#{usd10.amount} #{usd10.currency_code}"

puts "\nAdd usd1 and usd3 and store in new currency, usd11. Display usd11:"
usd11 = usd1 + usd3
puts usd11
puts "#{usd11.amount} #{usd11.currency_code}"

#Create new currency_converter object and add rates hash.
currency_converter = CurrencyConverter.new(currency_rates_feb16)

puts "\nDisplay hash of CurrencyConverter rates: "
puts currency_converter.currency_rates

puts "Convert 1 USD into EUR:"
converted_currency = currency_converter.convert(Currency.new(1, :USD), :EUR)
puts "#{converted_currency.amount} #{converted_currency.currency_code}"

puts "\nConvert 1 EUR into JPY:"
converted_currency = currency_converter.convert(Currency.new(1, :EUR), :JPY)
puts "#{converted_currency.amount} #{converted_currency.currency_code}"

puts "\nConvert USD into EUR: "
converted_currency = currency_converter.convert(Currency.new(usd_hard), :EUR)
puts "#{converted_currency.amount} #{converted_currency.currency_code}"

puts "\nRun currency trader which analyzes two sets of rates at different points"
puts "in time and shows the best investment currency:"
currency_trader = CurrencyTrader.new(currency_rates_feb15, currency_rates_feb16, usd_hard)
currency_trader.best_currency_investment

currency_trader = CurrencyTrader.new(currency_rates_feb15, currency_rates_feb16, eur_hard)
currency_trader.best_currency_investment
