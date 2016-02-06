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

    @old_rates_hash.each do |key, value|
      new_value = starting_amount * value
      array << new_value
    end

    counter = 0

    @new_rates_hash.each do |key, value|
      amount = (1/value) * array[counter]
      converted_hash[key] = amount
      counter += 1
    end

    max = converted_hash.key(converted_hash.values.max)
    puts "The best investment would be #{max} with a USD value of #{converted_hash[max].round(2)}"

  end
end
