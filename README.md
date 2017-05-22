Synopsis

This is a checkout system for an online marketplace. It has been designed to be flexible regarding promotional rules, so that rules can be changed easily at any time.


Code Example


def example_checkout(params)

  multi_buy_discount = MultiBuyDiscount.new({:amount_needed => 2, :product_code => "001", :discount_price => 8.50})
  percentage_discount = PercentageDiscount.new({:price_threshold => 60, :discount_percent => 10})
  promo_rules = [multi_buy_discount, percentage_discount]
  co = Checkout.new(promo_rules)
  params[:items].each { |x| co.scan(x)}
  price = co.total
  end
end

example_checkout({items: ["001","002","003"]})


def item_database_hash
  return {"001" => Item.new("Lavender heart", "001", 9.25), "002" => Item.new("Personalised cufflinks", "002", 45), "003" => Item.new("Kids T-shirt", "003", 19.95)}
end

Installation

Clone repo to local.

Tests

Run the following line in Terminal to run the tests.

ruby test_with_discount_promotion.rb

Contributors

Steven Clouston

This solution is based on the test below:

The Test
Our client is an online marketplace, here is a sample of some of the products available on our site:
Product code  | Name                   | Price
----------------------------------------------------------
001           | Lavender heart         | £9.25
002           | Personalised cufflinks | £45.00
003           | Kids T-shirt           | £19.95


Our marketing team want to offer promotions as an incentive for our customers to purchase these items.
If you spend over £60, then you get 10% off of your purchase. If you buy 2 or more lavender hearts then the price drops to £8.50.
Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.
The interface to our checkout looks like this (shown in Ruby):
co = Checkout.new(promotional_rules)
co.scan(item)
co.scan(item)
price = co.total


Implement a checkout system that fulfills these requirements. Do this outside of any frameworks. We’re looking for candidates to demonstrate their knowledge of TDD.

Test data
---------
Basket: 001,002,003
Total price expected: £66.78

Basket: 001,003,001
Total price expected: £36.95

Basket: 001,002,001,003
Total price expected: £73.76
