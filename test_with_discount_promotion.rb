require_relative('checkout')
require_relative('item')
require_relative('discount')

class Test

  def run_tests
    create_rules
    test({items: ["001","002","003"], correct_result: "£66.78"})
    test({items: ["001","003","001"], correct_result: "£36.95"})
    test({items: ["001","002","001","003"], correct_result: "£73.76"})
  end

  def create_rules
    @multi_buy_discount = MultiBuyDiscount.new({:amount_needed => 2, :code => "001", :discount_price => 8.50})
    @percentage_discount = PercentageDiscount.new({:price_threshold => 60, :discount_percent => 10})
    @promo_rules = [@multi_buy_discount, @percentage_discount]
  end

  def test(params)
    co = Checkout.new(@promo_rules)
    params[:items].each { |x| co.scan(x)}
    price = co.total
    correct_result = params[:correct_result]
    if price == correct_result
      puts "passed"
    else
      puts "failed"
    end
  end
end

my_test = Test.new
my_test.run_tests
