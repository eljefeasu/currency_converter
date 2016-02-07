class CurrencyTrader
  def initialize(old_rates_hash, new_rates_hash, currency_o)
    @old_rates_hash = old_rates_hash
    @new_rates_hash = new_rates_hash
    @currency_o = Currency.new(currency_o)
  end

  def best_currency_investment
    starting_currency = @currency_o.currency_code
    starting_amount = @currency_o.amount
    array = []
    converted_hash = {}

    #loop through old rates hash and convert for each currency. Store values in array.
    @old_rates_hash.each do |key, value|
      amount = (value/@old_rates_hash[starting_currency])
      new_value = starting_amount * amount
      array << new_value
    end

    counter = 0

    #loop through new rates hash and take converted rates to convert back into original currency
    @new_rates_hash.each do |key, value|
      amount = ((@new_rates_hash[starting_currency])/value) * array[counter]
      converted_hash[key] = amount
      counter += 1
    end

    max = converted_hash.key(converted_hash.values.max)
    puts "The best investment would be #{max} with a #{starting_currency} value of #{converted_hash[max].round(2)}"

  end
end
