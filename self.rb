class A
  def abc
    puts "self: #{self}"
    puts "self.class: #{self.class}"
    puts "self.class.class: #{self.class.class}"
    puts "self.class.superclass: #{self.class.superclass}"
  end
end

A.new.abc
A.ancestors