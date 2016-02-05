class CurrencyConverter
  def initialize(currency_rates)
    @currency_rates = currency_rates
  end

  def currency_rates
    puts @currency_rates
  end

  def convert(currency, currency_code)
    converted_amount = currency.amount * (@currency_rates[currency_code].to_f)
    return Currency.new(converted_amount, currency_code)
  end

end
