module A; end

x = proc { p self }
# x.call 3
class B
  def initialize(&block)
    # block.call
  end
end

ob = B.new
ob.instance_eval do
  x.call
end
# ob.method_name(&x)