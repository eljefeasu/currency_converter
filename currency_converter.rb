class CurrencyConverter
  def initialize(currency_rates)
    @currency_rates = currency_rates
  end

  def currency_rates
    puts @currency_rates
  end

  def convert(currency, currency_code)
    if @currency_rates.has_key?(currency_code) && @currency_rates.has_key?(currency.currency_code)
      if currency.amount == :USD
        converted_amount = currency.amount * (@currency_rates[currency_code].to_f)
      else
        converted_amount = @currency_rates[currency_code] / @currency_rates[currency.currency_code]
      end
      return Currency.new(converted_amount, currency_code)
    else
      raise UnknownCurrencyCodeError
    end
  end
end

class UnknownCurrencyCodeError < StandardError
  def initialize(msg='Unknown currency code used in conversion')
    super
  end
end
