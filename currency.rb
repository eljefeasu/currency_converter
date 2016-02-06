class Currency
  def initialize(amount, currency_code=:USD)
    @currency_symbols_hash = {"$" => :USD,
                              "€" => :EUR,
                              "£" => :GBP,
                              "₹" => :INR,
                              "¥" => :JPN}
    if @currency_symbols_hash.has_key?(amount.to_s[0])
      @currency_code = @currency_symbols_hash[amount[0]]
      amount[0] = ""
      @amount = amount.to_f
    else
      @amount = amount.to_f
      @currency_code = currency_code
    end
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
      return Currency.new((@amount + object.amount), @currency_code)
    else
      raise DifferentCurrencyCodeError
    end
  end

  def -(object)
    if @currency_code == object.currency_code
      return Currency.new((@amount - object.amount), @currency_code)
    else
      raise DifferentCurrencyCodeError
    end
  end

  def *(number)
    return Currency.new((@amount * number), @currency_code)
  end
end

class DifferentCurrencyCodeError < StandardError
  def initialize(msg='Currencies do not match. Cannot perform operation')
    super
  end
end
