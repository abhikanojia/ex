class Product
  
  attr_accessor :name, :price

  def initialize(name, price)
    
  end
end

class Tax
  
  attr_accessor :sales_tax, :export_duty

  def initialize(sales_tax = 0.1, export_duty = 0.05)
    @sales_tax = sales_tax
    @export_duty = export_duty
  end
end


class Cart
  
  @@cart_id = 1

  def initialize
    @@cart_id.succ
  end
end

class Invoice
  
  def initialize
    
  end
end

class Input

  def initialize
    
  end
end