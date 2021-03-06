# product class
class Product

  attr_accessor :name, :price, :sales_tax, :import_duty

  @@product_id = 0

  def initialize(product)
    @id = product[:id] = @@product_id += 1

    @name = product[:name]

    @price = product[:price].to_f

    @sales_tax = default_sales_tax(product)

    @import_duty = default_import_duty(product)
  end

  def default_sales_tax(product, s_tax = 10)
    product.has_key?(:has_sales_tax) ? s_tax.fdiv(100) * @price : 0.0
  end

  def default_import_duty(product, i_tax = 5)
    product.has_key?(:has_import_duty) ? i_tax.fdiv(100) * @price : 0.0
  end

  def subtotal
    @price + @sales_tax + @import_duty
  end

  def hash
    {
      _id: @id,
      name: @name,
      price: @price,
      sales_tax: @sales_tax,
      import_duty: @import_duty,
      subtotal: subtotal
    }
  end
end


# Cart class
class Cart

  def initialize
    @items = []
  end

  def self.id
    @@cart_id
  end

  def add(product)
    @items.push(product.hash)
  end

  def remove(id = nil)
    return @items.pop if id.nil?
    @items.each { |item| item.clear if item[:_id].eql? id }
    @items.delete_if(&:empty?)
  end

  def items
    @items
  end

  def get_total
    items.inject(0){ |sum, i| sum += i[:subtotal] }
  end
end

class Invoice

  def initialize

  end
end

class Input

  NAME = 'Name of the product: '.freeze
  IMPORTED = 'Imported?:(yes/no) '.freeze
  EXEMPTED = 'Extempted from sales tax?:(yes/no) '.freeze
  PRICE = 'Price: '.freeze
  ADD_MORE = 'Do you want to add more items to your list(y/n): '.freeze

  def initialize

  end
end

product_details = { name: "choco", price: 120, has_import_duty: true, has_sales_tax: true }
product_2 = { name: "potato", price: 100, has_import_duty: true }

p1 = Product.new(product_details)
p2 = Product.new(product_2)
cart = Cart.new
cart.add(p1)
cart.add(p2)

p cart.items
p cart.get_total

p cart.remove
p cart.items
