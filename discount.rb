require_relative('basket')
class Discount

  def initialize(params)
  end

  def calculate(basket, running_total)
    raise 'Not implemented'
  end
end

class MultiBuyDiscount < Discount

  def initialize(params)
    super(params)
    @amount_needed = params[:amount_needed]
    @code = params[:code]
    @discount_price = params[:discount_price]
  end

  def calculate(basket, running_total)
    delta = @discount_price.to_f - basket.find(@code).price.to_f
    multi_buy_count = basket.find_and_count(@code)
    return multi_buy_count * delta if multi_buy_count >= @amount_needed
    0.0
  end
end

class PercentageDiscount < Discount

  def initialize(params)
    super(params)
    @price_threshold = params[:price_threshold]
    @discount_percent = params[:discount_percent]
  end

  def calculate(_basket, running_total)
    delta = - running_total * (@discount_percent.to_f / 100)
    return delta if running_total > @price_threshold
    0.0
  end
end
