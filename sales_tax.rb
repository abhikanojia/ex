# Public - Class for holding various
# products and generating final output
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

  def generate_bill
    input = UserInput.new
    list_items.each do |key, _|
      yield input.data_format % [key.name.to_s, key.sales_tax.to_f, key.import_duty.to_f,
                                  key.price, key.sub_total.to_f]
    end
  end

  private

  def list_items
    @line_items
  end
end
# Product class - Holds Produc information and
# calculates related taxes
class Product
  attr_accessor :name, :price, :imported, :exempted
  attr_accessor :sales_tax, :import_duty, :sub_total

  def initialize
    @sales_tax = 0.1
    @import_duty = 0.05
    @sub_total = 0
    @this = self
  end

  def calculate_taxes
    @this.sales_tax = _sales_tax
    @this.import_duty = _import_duty
    @this.sub_total = total_taxes
  end

  private

  def _import_duty
    (@this.price * @import_duty).to_f if @this.imported.eql? 'yes'
  end

  def _sales_tax
    (@this.price * @sales_tax).to_f if @this.exempted.eql? 'no'
  end

  def total_taxes
    (@this.price.to_f + @this.sales_tax.to_f + @this.import_duty.to_f)
  end
end
# Public - for taking input and prompting
# messages to user
class UserInput
  attr_reader :header_format, :data_format

  def initialize
    @header_format = '%10s %15s %15s %15s %15s'
    @data_format = '%-10s %15.2f %15.2f %15.2f %15.2f'
  end

  def prompt_messages
    ['Name of the product: ', 'Imported?',
      'Extempted from sales tax?', 'Price:',
      'Do you want to add more items to your list(y/n):'].cycle
  end

  def headers
    ['Item Name |', 'Sales Tax |', 'Duty Tax |', 'Price |', 'Total Amount |']
  end

  def total_format
    '%69s %.2f'
  end
end

add_more = 'y'
input = UserInput.new
prompt = input.prompt_messages
line_items = LineItems.new

while add_more == 'y'
  product = Product.new
  print prompt.next
  product.name = gets.chomp
  print prompt.next
  product.imported = gets.chomp
  print prompt.next
  product.exempted = gets.chomp
  print prompt.next
  product.price = gets.chomp.to_f
  puts prompt.next
  product.calculate_taxes
  line_items.push(product)
  add_more = gets.chomp
end
puts
puts input.header_format % input.headers
puts '----------------------------------------------------------------------------'
line_items.generate_bill do |data|
  puts data
  puts '----------------------------------------------------------------------------'
end
print input.total_format % ['Total Amount:', " #{line_items.total_bill}"]
