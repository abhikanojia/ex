# Shopping class
class ShoppingList
  def initialize
    @items = {}
  end

  def add(product_name, product_quantity)
    if @items.key? product_name
      @items[product_name] += product_quantity
    else
      @items.store(product_name, product_quantity)
    end
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
  add('Computer', 2)
  add('Toothpaste', 1)
end

p s1.list_items
