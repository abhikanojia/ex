# Class Methods
module ClassMethods
  def find_by_name(name)
    puts "find by name"
  end

  def find_by_email(email)
    puts "find by email"
  end

  def validate_presence_of(*attributes)
    attributes.each do |attr|
      validator_name = "#{attr}_defined?"
      @method_names << validator_name
      define_method(validator_name) do
        if instance_variable_defined?("@#{attr}")
          true
        else
          !errors.push("#{attr} not defined")
        end
      end
    end
  end

  def collect
    @list
  end

  def count
    @list.count
  end

  def method_names
    @method_names
  end
end

# Object Store
module MyObjectStore
  def self.included(class_name)
    class_name.extend(ClassMethods)
    class_name.class_eval do
      @list = []
      @method_names = []

      def initialize
        @errors = []
      end

      def self.push_object_to_list(obj)
        @list << obj
      end
    end
  end

  def save
    if validator
      self.class.push_object_to_list(self)
      'Saved Successfully'
    else
      errors.each {|error| puts error }
    end
  end
end

class Play
  include MyObjectStore
  attr_accessor :age, :fname, :errors, :method_names
  validate_presence_of :age, :fname

  def validator
    self.class.method_names.all? { |x| public_send(x) }
  end
end

Play.find_by_email("Asd")

a = Play.new
a.fname = "adasd"
a.age = 23
a.save


b = Play.new
b.fname = "Abhishek"
# b.age = 23
b.save


p Play.collect
p Play.count