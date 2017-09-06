# Public - Class for holding various
# products and generating final output
class Cart
  attr_reader :line_items
  def initialize
    @line_items = []
  end

  def add(product)
    @line_items.push(product)
  end

  def items_total
    line_items.inject(0) do |sum, item|
      sum + item.sub_total
    end
  end
end

# Product class - Holds Produc information and
# calculates related taxes
class Product
  IMPORTED = 'yes'.freeze
  EXEMPTED = 'no'.freeze
  attr_accessor :name, :price, :imported, :exempted
  attr_accessor :sales_tax, :import_duty, :sub_total

  def initialize(sales_tax, import_duty)
    @sales_tax_on_all = sales_tax
    @import_duty_on_all = import_duty
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

# takes input from user
class Input
  NAME = 'Name of the product: '.freeze
  IMPORTED = 'Imported?:(yes/no) '.freeze
  EXEMPTED = 'Extempted from sales tax?:(yes/no) '.freeze
  PRICE = 'Price: '.freeze
  ADD_MORE = 'Do you want to add more items to your list(y/n): '.freeze

  def initialize(cart, add_more = true)
    @add_more = add_more
    @cart = cart
  end

  def get_user_input
    prompt = messages
    while @add_more
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
      @cart.add(product)
      @add_more = add_more?(gets.chomp)
    end
  end

  private

  def add_more?(value)
    value == 'y' ? true : false
  end

  def messages
    [NAME, IMPORTED, EXEMPTED, PRICE, ADD_MORE].cycle
  end
end
# for generating bill
class Invoice
  HEADER_FORMAT = '%10s %15s %15s %15s %15s'.freeze
  DATA_FORMAT = '%-10s %15.2f %15.2f %15.2f %15.2f'.freeze
  TOTAL_FORMAT = '%68s %.2f'.freeze
  TOTAL = 'Total Amount:'.freeze
  HEADER = ['Item Name', 'Sales Tax', 'Duty Tax', 'Price', 'Total Amount'].freeze

  def initialize(cart, print_format = {})
    default = {
      header_format: HEADER_FORMAT,
      data_format: DATA_FORMAT,
      total_format: TOTAL_FORMAT
    }
    @print_format = default.merge(print_format)
    @cart = cart
  end

  def items
    @cart.line_items.each do |item, _|
      item_details = []
      item_details.push(
        item.name.to_s, item.sales_tax.to_f,
        item.import_duty.to_f, item.price.to_f,
        item.sub_total.to_f
      )
      yield @print_format[:data_format] % item_details
    end
  end

  def print_data
    yield print_header
    yield next_line
    items do |data|
      yield data
    end
    yield next_line
    yield total_bill_amount
  end

  private

  def print_header
    @print_format[:header_format] % headers.map { |header| header << ' |' }
  end

  def next_line
    '-' * 75
  end

  def total_bill_amount
    format(@print_format[:total_format].to_s, TOTAL, @cart.items_total)
  end

  def headers
    HEADER
  end
end


cart = Cart.new

user_input = Input.new(cart, true)

user_input.get_user_input

parameters = {
  header_format: '%10s %15s %15s %15s %17s',
  data_format: '%-10s %15.2f %15.2f %15.2f %15.0f'
}
invoice = Invoice.new(cart, parameters)

invoice.print_data do |data|
  puts data
end

