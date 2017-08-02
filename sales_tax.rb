# Public - Method for calculating total_amount
class Array
  def total_amount
    total_amt = 0
    each do |key, _|
      total_amt += key.amt_after_tax
    end
    total_amt
  end
end
# Product class
class Product
  attr_reader :name, :price, :imported, :whether_extempted
  attr_accessor :sales_tax, :import_duty, :amt_after_tax

  def initialize(name, price, imported, whether_exempted)
    @name = name
    @price = price.to_f
    @imported = imported
    @exempted = whether_exempted
  end

  def exempted?
    ['yes', 'y'].include?(@exempted)
  end

  def imported?
    ['yes', 'y'].include?(@imported)
  end
end
# Class for calculating sales tax
class SalesTax
  def initialize
    @sales_tax = 0.1
    @import_duty = 0.05
  end

  def total_taxes(product)
    product.amt_after_tax = product.price + product.sales_tax + product.import_duty
  end

  def sales_taxes(product)
    if product.exempted?
      product.sales_tax = 0
    else
      product.sales_tax = (product.price * @sales_tax)
    end
  end

  def import_duty_amount(product)
    if product.imported?
      product.import_duty = (product.price * @import_duty)
    else
      product.import_duty = 0
    end
  end
end

product_list = []
add_more = 'y'

while add_more == 'y'
  puts
  puts 'Name of the product: '
  name = gets.chomp
  print 'Imported?'
  imported = gets.chomp
  print 'Extempted from sales tax?'
  exempted = gets.chomp
  print 'Price:'
  price = gets.chomp
  # create new product
  product = Product.new(name, price, imported, exempted)
  tax = SalesTax.new
  tax.sales_taxes(product)
  tax.import_duty_amount(product)
  tax.total_taxes(product)
  product_list.push(product)
  # Create more
  print 'Do you want to add more items to your list(y/n):'
  add_more = gets.chomp
end

puts
format = '%10s %15s %15s %15s %15s'
format_out = '%-10s %15.2f %15.2f %15.2f %15.2f'

puts format % ['Item Name |', 'Sales Tax |', 'Duty Tax |', 'Price |', 'Total Amount |']
puts '----------------------------------------------------------------------------'
product_list.each do |key, _|
  puts format_out % [key.name.to_s, key.sales_tax, key.import_duty,
                     key.price, key.amt_after_tax]
  puts '----------------------------------------------------------------------------'
end
puts
print format('%70s %.2f', 'Total Amount:', " #{product_list.total_amount}")
