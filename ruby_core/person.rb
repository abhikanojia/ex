
class Person < Struct.new(:name, :likes)
  def to_s
    "#{self.name} likes #{self.likes}"
  end
end
d = Person.new('dave', 'ruby')

puts d