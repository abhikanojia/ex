# Class Methods module
module ClassMethods
  def define_dirty_attributes(*args)
    args.each do |attribute|
      instance_variable = "@#{attribute}"

      create_last_attribute_method(attribute) # create methods like :name_was, :age_was

      create_instance_reader_method(attribute, instance_variable) # create_ instance method like :name, :age

      create_instance_writer_method(attribute, instance_variable) # create writer method :name=, :age=

      create_change_in_hash_method # returns changes in hash, callback of :changes

      create_change_status_predicate_method # create :changed_status? method, callback of :changed?

      create_save_object_method # create_:save_object method, callback of :save

      add_new_methods_to_class # opens class to add class variable and private methods
    end
  end

  private

  def add_new_methods_to_class
    class_eval do
      def initialize
        @dirty_attributes = Hash.new(Array.new(2))
      end

      attr_accessor :dirty_attributes

      def record_change(symbol, value)
        change_hash_has_value?(symbol, value) ? delete_attr_from_hash(symbol) : add_new_change_to_hash(symbol, value)
        change_status(symbol)
      end

      private

      def delete_attr_from_hash(symbol)
        @dirty_attributes.delete(symbol)
      end

      def add_new_change_to_hash(symbol, value)
        @dirty_attributes[symbol] += [value]
      end

      def change_hash_has_value?(symbol, value)
        @dirty_attributes[symbol].include? value
      end

      def change_status(symbol)
        @dirty_attributes[symbol].delete_at(0)
        @@changed_status = true
      end
    end
  end

  def create_save_object_method
    define_singleton_method(:save_object) do
      @@changed_status = false
      true
    end
  end

  def create_change_status_predicate_method
    define_singleton_method(:changed_status?) do
      (!@@changed_status) ? false : @dirty_attributes.any?
    end
  end

  def create_change_in_hash_method
    define_singleton_method(:change_in_hash) do
      !@@changed_status ? {} : @dirty_attributes
    end
  end

  def create_last_attribute_method(attribute)
    define_method("#{attribute}_was") do
      @dirty_attributes[attribute].first
    end
  end

  def create_instance_reader_method(attribute, instance_variable)
    define_method("#{attribute}") do
      instance_variable_get instance_variable
    end
  end

  def create_instance_writer_method(attribute, instance_variable)
    define_method("#{attribute}=") do |value|
      record_change(attribute.to_sym, value)
      instance_variable_set instance_variable, value
    end
  end
end
# Dirty Object
module DirtyObject
  def class_name
    self.class
  end

  def changed?
    class_name.changed_status?
  end

  def save
    class_name.save_object
  end

  def changes
    class_name.change_in_hash
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end
end

class User
  include DirtyObject
  attr_accessor :email

  define_dirty_attributes :name, :age
end


# @dirty_attributes  {email: [3, 4], name: [nil, nil]}

# p User.instance_methods

u = User.new
p u
exit
u.name = 'Akhil'
u.email = 'akhil@vinsol.com'
u.age = 30

p u.changed?
p u.changes


p u.name_was
# p u.email_was # should give an error
p u.age_was

puts "----------Saving Object ------"
p u.save # yet to implement

puts '--------CHeck again---------'
p u.changed?
p u.changes

puts '----------Assigned new value---------'
u.name = 'New Value'
u.age = 31
p u.changes
p u.name_was

puts '---------Name reassinged Abhishek----------'
u.name = 'Akhil'
p u.changes
p u.changed?

u.age = 30
p u.changes
p u.changed?