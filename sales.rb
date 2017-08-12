# Invalid details error
class NoNameError < StandardError; end
# Cart class
class Cart
  attr_accessor :items
  
  def initialize
    @items = []
  end

  def get_cart_items
    @items.to_a
  end

  def bill_amount
    
  end
end

# Product class
class Product
	attr_accessor :name, :price, :sales_tax, :import_duty
  attr_accessor :imported, :exempted, :sub_total

	def initialize(sales_tax, import_duty)
    @import_duty = import_duty
    @sales_tax = sales_tax	
    @sub_total = 0
	end

  def add_to_cart(cart)
    append_taxes
    cart.items.push(self)
  end

  private

  def append_taxes
    @sales_tax = Float(get_sales_tax)
    @import_duty = get_import_duty
    @sub_total = Float(@sales_tax.to_f + @import_duty.to_f + @price.to_f)
  end

  def get_import_duty
    imported? ? (self.price * @import_duty).to_f : 0
  end

  def get_sales_tax
    exempted? ? (self.price * @sales_tax).to_f : 0 
  end

  def imported?
    self.imported.eql? "yes"
  end

  def exempted?
    self.exempted.eql? "no"
  end
end

class Input
  def self.product_details
    ['Name of the product: ', 'Imported?',
      'Exempted from sales tax?', 'Price:',
      'Do you want to add more items to your list(y/n):'].cycle
  end
end

class Output
  def self.header
    
  end
  def self.total_amount(cart, format_out)
    format_out % ['Total Amount:', " 232"]
  end
end


add_more = 'y'
prompt = Input.product_details

while add_more == 'y'
  begin
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
    cart = Cart.new
    product.add_to_cart(cart)
    add_more = gets.chomp
  rescue NoNameError
    print 'Invalid Input'
    exit
  end
end
puts
# puts input.header_format % input.headers
# puts '-' * 80
# line_items.generate_bill do |data|
#   puts data
#   puts '-' * 80
# end
# puts Output.total_amount(cart, '%69s %.2f') 
print product.inspect