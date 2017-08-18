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
    @line_items.inject(0) { |sum, item| sum + item.sub_total }
  end
end
# Product class - Holds Produc information and
# calculates related taxes
class Product
  IMPORTED = 'yes'
  EXEMPTED = 'no'
  attr_accessor :name, :price, :imported, :exempted
  attr_accessor :sales_tax, :import_duty, :sub_total

  def initialize(sales_tax, import_duty)
    @sales_tax_on_all = sales_tax
    @import_duty_on_all = import_duty
    @sub_total
    @this = self
  end

  def price_after_taxes
    @this.sales_tax = item_sales_tax
    @this.import_duty = item_import_duty
    @this.sub_total = (@this.price.to_f + @this.sales_tax + @this.import_duty)
  end

  private

  def item_import_duty
    @this.imported == IMPORTED ? (@this.price * @import_duty_on_all).to_f : 0.0
  end

  def item_sales_tax
    @this.exempted == EXEMPTED ? (@this.price * @sales_tax_on_all).to_f : 0.0
  end
end
# Public - for taking input and prompting
# messages to user
class Output
  attr_reader :header_format, :data_format, :total_format

  def initialize(header_format, data_format, total_format)
    @header_format = header_format
    @data_format = data_format
    @total_format = total_format
  end

  def headers
    ['Item Name', 'Sales Tax', 'Duty Tax', 'Price', 'Total Amount']
  end
end
# takes input from user
class Input
  attr_accessor :next_product

  def initialize
    @add_more = 'y'
    @cart = Cart.new
  end

  def get_user_input
    prompt = messages
    while @add_more.eql? 'y'
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
      product.price_after_taxes
      @cart.push(product)
      @add_more = gets.chomp
    end
  end

  def generate_bill
    @cart.line_items.each do |item, _|
      item_details = []
      item_details << item.name.to_s << item.sales_tax.to_f
      item_details << item.import_duty.to_f << item.price.to_f
      item_details << item.sub_total.to_f
      yield item_details
    end
  end

  def total_bill
    @cart.total_bill
  end
  
  private

  def messages
    ['Name of the product: ', 'Imported?',
      'Extempted from sales tax?', 'Price:',
      'Do you want to add more items to your list(y/n):'].cycle
  end
end

user_input = Input.new
user_input.get_user_input

output = Output.new
       (
          '%10s %15s %15s %15s %15s',
          '%-10s %15.2f %15.2f %15.2f %15.2f',
          '%69s %.2f'
        )

puts
puts output.header_format % output.headers.map { |header|  header << " |" }
puts '-' * 75
user_input.generate_bill do |data|
  puts output.data_format % data
  puts '-' * 75
end
puts output.total_format % ['Total Amount:', " #{user_input.total_bill}"]
