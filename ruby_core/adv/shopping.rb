# Shopping class
class ShoppingList
  def initialize
    @items = Hash.new(0)
  end

  def add(product_name, product_quantity)
    @items[product_name] += product_quantity
  end

  def items(&block)
    block_given? ? instance_eval(&block) : abort('No Block given.. exiting..')
  end

  def list_items
    @items
  end
end

s1 = ShoppingList.new


s1.items do
  add('Toothpaste', 2)
  add('Computer', 2)
  add('Toothpaste', 1)
end

p s1.list_items
