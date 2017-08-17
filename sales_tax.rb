# Public - Class for holding various
# products and generating final output
class Cart
  attr_reader :line_items
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
    @line_items.each do |item, _|
      item_details = []
      item_details << item.name.to_s << item.sales_tax.to_f
      item_details << item.import_duty.to_f << item.price.to_f
      item_details << item.sub_total.to_f
      yield item_details
    end
  end
end
# Product class - Holds Produc information and
# calculates related taxes
class Product
  attr_accessor :name, :price, :imported, :exempted
  attr_accessor :sales_tax, :import_duty, :sub_total

  def initialize(sales_tax, import_duty)
    @sales_tax = sales_tax
    @import_duty = import_duty
    @sub_total = 0
    @this = self
  end

  def calculate_taxes
    @this.sales_tax = item_sales_tax
    @this.import_duty = item_import_duty
    @this.sub_total = price_after_taxes
  end

  private

  def item_import_duty
    (@this.price * @import_duty).to_f if @this.imported.eql? 'yes'
  end

  def item_sales_tax
    (@this.price * @sales_tax).to_f if @this.exempted.eql? 'no'
  end

  def price_after_taxes
    (@this.price.to_f + @this.sales_tax.to_f + @this.import_duty.to_f)
  end
end
# Public - for taking input and prompting
# messages to user
class UserInput
  attr_reader :header_format, :data_format, :total_format

  def initialize(header_format, data_format, total_format)
    @header_format = header_format
    @data_format = data_format
    @total_format = total_format
  end

  def prompt_messages
    ['Name of the product: ', 'Imported?',
      'Extempted from sales tax?', 'Price:',
      'Do you want to add more items to your list(y/n):'].cycle
  end

  def headers
    ['Item Name', 'Sales Tax', 'Duty Tax', 'Price', 'Total Amount']
  end
end

add_more = 'y'
input = UserInput.new(
          '%10s %15s %15s %15s %15s', 
          '%-10s %15.2f %15.2f %15.2f %15.2f',
          '%69s %.2f'
        )
prompt = input.prompt_messages
line_items = Cart.new

while add_more == 'y'
  product = Product.new(0.1, 0.05)
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
puts input.header_format % input.headers.map { |header|  header << " |" }
puts '-' * 80
line_items.generate_bill do |data|
  puts input.data_format % data
  puts '-' * 80
end
puts input.total_format % ['Total Amount:', " #{line_items.total_bill}"]
