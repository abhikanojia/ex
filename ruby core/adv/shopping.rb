# Shopping class
class ShoppingList
  def initialize
    @items = []
  end

  def add(product_name, product_quantity)
    product = { name: product_name, quantity: product_quantity }
    @items.push(product)
  end

  def items(&block)
    instance_eval(&block)
  end

  def list_items
    @items
  end
end

s1 = ShoppingList.new

s1.items do
  add('Toothpaste', 2)
  add('Computer', 1)
end