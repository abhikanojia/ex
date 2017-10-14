module MyObjectStore
  module ClassMethods
    def validates_presence_of(*arguments)
      @@arguments = arguments
      @valid_objects = []
      add_new_methods
    end

    def validates_numericality_of(*arguments)
      @@validates_numericality_args = arguments
    end

    def add_new_methods
      class_eval do
        attr_reader :errors
        attr_accessor :valid
        def initialize
          @errors = Hash.new([])
        end
      end
    end

    def validates_numericality_of_arguments
      @@validates_numericality_args
    end

    def validate_presence_of_arguments
      @@arguments
    end

    def add_to_valid_objects(object)
      @valid_objects.push(object)
    end

    def object_already_exist?(object)
      @valid_objects.include? object
    end

    def collect
      @valid_objects
    end

    def count
      collect.count
    end
  end

  module InstanceMethods
    def class_name
      self.class
    end

    def argument_exists(argument)
      if !instance_variable_defined?("@#{argument}")
        @valid = false
        @errors.store(argument, ['can\'t be blank'])
      end
    end

    def argument_numeric(argument)
      if !self.age.is_a?(Integer)
        self.valid = false
      end
    end

    def valid?
      return true if valid
      @valid = true
      class_name.validate_presence_of_arguments.each do |argument|
        argument_exists(argument)
      end

      class_name.validates_numericality_of_arguments.each do |argument|
        argument_numeric(argument)
      end

      class_name.add_to_valid_objects(self) if valid && !already_exist?
      @valid
    end

    def already_exist?
      class_name.object_already_exist?(self)
    end

    def save
      if valid
        print "Object Saved"
      else
        p errors
      end
    end
  end

  def self.included(receiver)
    receiver.extend(ClassMethods)
    receiver.send :include, InstanceMethods
  end
end

class A
  include MyObjectStore
  attr_accessor :name, :age

  validates_presence_of :name, :age
  validates_numericality_of :age
end


ob = A.new

ob.name = 'Abhishek'
ob.age = 23
p "Save"
ob.save

p "errors"
p ob.errors

p "valid"
p ob.valid?
p ob.valid?


p "errors"
p ob.errors

p A.collect
p A.count
p ob