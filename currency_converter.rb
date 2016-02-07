class CurrencyConverter
  def initialize(currency_rates)
    @currency_rates = currency_rates
  end

  def currency_rates
    puts @currency_rates
  end

  def convert(object, currency_code)
    if  @currency_rates.has_key?(object.currency_code) && @currency_rates.has_key?(currency_code)
      converted_amount = (@currency_rates[currency_code] / @currency_rates[object.currency_code]) * object.amount
      return Currency.new(converted_amount.round(2), currency_code)
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
