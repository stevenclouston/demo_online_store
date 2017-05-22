class ItemsDatabase

  def initialize(params)
    @products = params
  end

  def all
    @products
  end

  def find(code)
    @products[code]
  end

end
