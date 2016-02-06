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

    @old_rates_hash.each do |key, value|
      new_value = starting_amount * value
      array << new_value
    end

    puts "#{array}"

  end
end
