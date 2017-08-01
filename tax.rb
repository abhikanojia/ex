class TaxCalculator
  def initialize(name, &block)
    @name = name
    @block = block
  end

  def show_tax
    tax = tax(100)
    @block.call(tax)
  end

  def tax(amt)
    amt * 0.75
  end
end

ob = TaxCalculator.new("sales") { |amt| print "#{amt}" }
ob.show_tax
