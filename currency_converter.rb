class Currency_Converter
  def initialize
    @currency_rates = {USD: 1.0, EUR: 0.74}
  end

  def currency_rates
    puts @currency_rates
  end

end
