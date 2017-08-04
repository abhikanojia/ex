# Public - Method for calculating total_amount
class LineItems
  def initialize
    @line_items = []
    @total_amount = 0
  end

  def push(product)
    @line_items << product
  end

  def total_bill
    @line_items.each { |item| @total_amount += item.sub_total }
    @total_amount
  end

  def get_list
    @line_items.to_enum
  end

  def generate_bill
    @line_items.get_list.each do |key, _|
      yield [key.name.to_s, key.sales_tax, key.import_duty,
                      key.price, key.amt_after_tax]
    end
  end
end
# Product class
class Product
  attr_accessor :name, :price, :imported, :exempted
  attr_accessor :sales_tax, :import_duty, :sub_total

  def initialize
    @sales_tax = 0.1
    @import_duty = 0.05
    @sub_total = 0
  end

  def calculate_taxes
    self.sales_tax = get_sales_tax
    self.import_duty = get_import_duty
    self.sub_total = total_taxes
  end

  private

  def get_import_duty
    (self.price * @import_duty).to_f if self.imported.eql? "yes"
  end

  def get_sales_tax
    (self.price * @sales_tax).to_f if self.exempted.eql? "no"
  end

  def total_taxes
    (self.price + self.sales_tax + self.import_duty)
  end
end

class UserInputOutput
  attr_reader :header_format, :data_format

  def initialize
    @header_format = '%10s %15s %15s %15s %15s'
    @data_format = '%-10s %15.2f %15.2f %15.2f %15.2f'
  end

  def prompt_messages
    ['Name of the product: ', 'Imported?', 'Extempted from sales tax?', 'Price:',
      'Do you want to add more items to your list(y/n):']
  end

  def headers
    ['Item Name |', 'Sales Tax |', 'Duty Tax |', 'Price |', 'Total Amount |']
  end

  def total_format
    ['%70s %.2f']
  end
end

add_more = 'y'
input = UserInputOutput.new
product = Product.new
line_items = LineItems.new

while add_more == 'y'
  print input.prompt_messages.first
  product.name = gets.chomp
  print input.prompt_messages[1]
  product.imported = gets.chomp
  print input.prompt_messages[2]
  product.exempted = gets.chomp
  print input.prompt_messages[3]
  product.price = gets.chomp.to_f
  puts input.prompt_messages.last
  product.calculate_taxes
  line_items.push(product)
  add_more = gets.chomp
end

print input.header_format % input.headers
line_items.get_list.each do |key, _|
  puts input.data_format % [key.name.to_s, key.sales_tax, key.import_duty,
                      key.price, key.amt_after_tax]
end
print format(input.total_format, 'Total Amount:', " #{product_list.total_amount}")

# puts
# format = '%10s %15s %15s %15s %15s'
# format_out = '%-10s %15.2f %15.2f %15.2f %15.2f'

# puts format % ['Item Name |', 'Sales Tax |', 'Duty Tax |', 'Price |', 'Total Amount |']
# puts '----------------------------------------------------------------------------'
# product_list.each do |key, _|
#   puts format_out % [key.name.to_s, key.sales_tax, key.import_duty,
#                      key.price, key.amt_after_tax]
#   puts '----------------------------------------------------------------------------'
# end
# puts
# print format('%70s %.2f', 'Total Amount:', " #{product_list.total_amount}")
