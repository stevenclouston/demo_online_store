require_relative('item')
require_relative('basket')

class Checkout

  attr_reader :basket

  def initialize(promotional_rules)
    @basket = Basket.new(item_database_hash)
    @promotional_rules = promotional_rules
  end

  def scan(item)
    @basket.add(item)
  end

  def total
    total = @promotional_rules.inject(@basket.total) do |running_total, rule|
      running_total + rule.calculate(@basket, running_total)
    end
    "£#{total.round(2)}"
  end

  def item_database_hash
    return {"001" => Item.new("Lavender heart", "001", 9.25), "002" => Item.new("Personalised cufflinks", "002", 45), "003" => Item.new("Kids T-shirt", "003", 19.95)}
  end
end
