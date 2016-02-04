class Currency
  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end

  def amount
    @amount
  end

  def currency_code
    @currency_code
  end

  def ==(object)
    if @currency_code == object.currency_code && @amount == object.amount
      return true
    else
      return false
    end
  end

  def +(object)
    if @currency_code == object.currency_code
      puts "#{@amount + object.amount} #{@currency_code}"
    else
      DifferentCurrencyCodeError(false)
    end
  end

  def -(object)
    if @currency_code == object.currency_code
      puts "#{@amount - object.amount} #{@currency_code}"
    else
      DifferentCurrencyCodeError(false)
    end
  end

  def DifferentCurrencyCodeError(value)
    raise TypeError, 'The currencies are not the same'
  end
end
