class Currency
  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end

  def ==(object)
    if @amount == object.amount && @currency_code == object.currency_code
      return true
    else
      return false
    end
  end

  def amount
    @amount
  end

  def currency_code
    @currency_code
  end

end
