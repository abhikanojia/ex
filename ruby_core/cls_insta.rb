# change
module ClassMethods
  def dirty_attributes(*args)
    initialize_class
    args.each do |attribute|
      instance_variable = "@#{attribute}"
      create_instance_reader_method(attribute, instance_variable)
      create_instance_writer_method(attribute, instance_variable)
      create_last_attribute_method(attribute)
    end
  end

  def initialize_class
    class_eval do
      def initialize
        @dirty_attributes = Hash.new(Array.new(2))
        @dirty_hash_change = false
        @dirty_db = Hash.new(Array.new(2))
      end

      private

      def delete_attr_from_hash(symbol)
        @dirty_attributes.delete(symbol)
        # @dirty_hash_change = false if @dirty_attributes.
      end

      def add_new_change_to_hash(symbol, value)
        @dirty_attributes[symbol] += [value]
      end

      def dirty_attributes_key_value_exists?(key, value)
        @dirty_attributes.key?(key) && @dirty_attributes[key].include?(value)
      end

      def record_change(attribute, value)
        if dirty_attributes_key_value_exists?(attribute, value)
          delete_attr_from_hash(attribute) if !@dirty_hash_change
        else
          add_new_change_to_hash(attribute, value)
          change_status(attribute)
        end
      end

      def change_status(symbol)
        @dirty_attributes[symbol].delete_at(0)
        @dirty_hash_change = true
      end

      def save_object
        @dirty_hash_change = false
        @dirty_db = @dirty_attributes
        @dirty_attributes.clear
        true
      end

      def dirty_db_doesnt_have(value)
        @dirty_db.none? { |key, keyvalue| keyvalue.include? value }
      end
    end
  end

  private

  def create_last_attribute_method(attribute)
    define_method("#{attribute}_was") do
      p @dirty_attributes[attribute].first
    end
  end

  def create_instance_reader_method(attribute, instance_variable)
    define_method("#{attribute}") do
      instance_variable_get instance_variable
    end
  end

  def create_instance_writer_method(attribute, instance_variable)
    define_method("#{attribute}=") do |value|
      return if value.nil?
      record_change(attribute.to_sym, value) if dirty_db_doesnt_have(value)
      instance_variable_set instance_variable, value
    end
  end
end

module Dirty
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def changes
    p (!@dirty_hash_change ? {} : @dirty_attributes)
  end

  def changed?
    p (!@dirty_hash_change ? false : @dirty_attributes.any?)
    # p @dirty_attributes.any?
  end

  def save
    save_object
  end

  def method_missing(name)
    puts "Undefined method....."
  end
end

class User
  include Dirty
  attr_accessor :name, :age
  dirty_attributes :name, :age
end


u = User.new

u.name = 'Akhil'
u.age = 30

u.changed?
u.changes

u.name_was
u.email_was
u.age_was

u.save

u.changed?
u.changes


u.name = 'New name'
u.age = 31

u.changes
u.name_was

u.name = 'Akhil'
u.changes
u.changed?

u.age = 30
u.changes

u.changed?


# u = User.new

# p u.name # nil
# p u.age # nil

# p "Changes"
# u.changes # {}


# u.name = nil
# u.age = nil

# u.changes # {}

# u.name = 'TEST'
# u.age = 30

# # p u.name

# u.changes # {:name=>[nil, "TEST"], :age=>[nil, 30]}

# u.name = 'TEST'
# u.age = 30

# p "changes 2"

# u.changes # {:name=>[nil, "TEST"], :age=>[nil, 30]}

# u.save

# u.changes # {}