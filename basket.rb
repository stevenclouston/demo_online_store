require_relative('items_database')

class Basket

  def initialize(item_database_hash)
    @product_database = ItemsDatabase.new(item_database_hash)
    @basket = []
  end

  def add(item_number)
    item = @product_database.find(item_number)
    if item
      @basket.push(item)
    else
      puts "Item " + item_number + " does not exist"
    end
  end

  def total
    @basket.inject(0.0) { |result, product| result + product.price}
  end

  def find(code)
    @product_database.find(code)
  end

  def find_and_count(code)
    count_val = @basket.inject(0) do |counter, item|
      counter += (item.code == code ? 1 : 0)
    end
    count_val
  end

  def all
    product_database
  end
end
