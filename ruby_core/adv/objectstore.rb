class InvalidParameter < StandardError; end

module ClassMethods
  def find_by_name(name)
    puts "find by name"
  end

  def find_by_email(email)
    puts "find by email"
  end

  def validate_presence_of(*attributes)
    puts "validate_presence_of"
    attributes.each do |attr|
      define_method("#{attr}") do
        instance_variable_defined?("@#{attr}")
      end
    end
  end

  def collect
    p @list
  end

  def count
    @list.count
  end
end

module MyObjectStore
  def self.included(class_name)
    class_name.extend(ClassMethods)
    class_name.class_eval do
      @list = []

      def self.push_object_to_list(obj)
        @list << obj
      end
    end
  end

  def save
    if validate
      self.class.push_object_to_list(self)
      'Created'
    else
      'Validation fails'
    end
  end
end

class A
  NAME = /^a/
  include MyObjectStore
  attr_accessor :fname, :lname
  validate_presence_of :fname, :lname

  def validate
    p instance_variables
    instance_variables.all? do |x|
      # p self, x
      print "#{x}"
      self.respond_to?("#{x}")
    end
  end
end

A.find_by_email("Asd")

a = A.new
a.fname = "adasd"
a.lname = "kanojia"
p a.save
A.collect

