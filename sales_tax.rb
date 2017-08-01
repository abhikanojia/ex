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
    true if @exempted == "y"
  end

  def imported?
    true if @imported == "y"
  end
end

class SalesTax
  def initialize
    @sales_tax = 0.1
    @import_duty = 0.05
  end

  def totalTax(product)
    product.amt_after_tax  = product.price + product.sales_tax + product.import_duty
  end

  def salesTax(product)
    if product.exempted?
      product.sales_tax = 0
    else
      product.sales_tax = (product.price * @sales_tax)
    end
  end

  def importDuty(product)
    if product.imported?
      product.import_duty = (product.price * @import_duty)
    else
      product.import_duty = 0
    end
  end
end

# product = Product.new("Chocolates", 120, "y", "n")
# tax = SalesTax.new
# print tax.sales_tax(product)
product_list = []

add_more = "y"

while add_more == "y"
  print "Name of the product: "
  name = gets.chomp
  print "Imported?"
  imported = gets.chomp
  print "Extempted from sales tax?"
  exempted = gets.chomp
  print "Price:"
  price = gets.chomp

  # create new product
  product = Product.new(name, price, imported, exempted)
  tax = SalesTax.new
  tax.salesTax(product)
  tax.importDuty(product)
  tax.totalTax(product)

  product_list.push(product)

  # Create more
  print "Do you want to add more items to your list(y/n):"
  add_more = gets.chomp
end

#print product_list.total_amount
print "\n\n"
print format("%0s" "%10s" "%10s" "%10s" "%10s",
              "| Item Name |", " Sales Tax |", " Duty Tax |", " Price |", " Total Price |\n")
product_list.each do |key, _|
  print format("%0s" "%10s" "%10s" "%10s" "%10s",
                "| " + key.name.to_s + " | ", key.sales_tax.to_s + " | ", key.price.to_s + " | ",
                key.price.to_s + " | ", key.amt_after_tax.to_s + " | \n"
              )
end

print "\n\n"
print format("%20s", "Total Amount: #{product_list.total_amount}")
