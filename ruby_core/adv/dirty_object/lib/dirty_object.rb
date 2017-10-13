# change
module ClassMethods
  def define_dirty_attributes(*args)
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
      end

      private

      def delete_attr_from_hash(symbol)
        @dirty_attributes.delete(symbol)
      end

      def add_new_change_to_hash(symbol, value)
        @dirty_attributes[symbol] += [value]
      end

      def dirty_attributes_key_value_exists?(key, value)
        @dirty_attributes.key?(key) && @dirty_attributes[key].include?(value)
      end

      def record_change(attribute, value)
        dirty_attributes_key_value_exists?(attribute, value) ? delete_attr_from_hash(attribute) : add_new_change_to_hash(attribute, value)
        change_status(attribute)
      end

      def change_status(symbol)
        @dirty_attributes[symbol].delete_at(0)
        @dirty_hash_change = true
      end

      def save_object
        @dirty_hash_change = false
        p true
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
      record_change(attribute.to_sym, value)
      instance_variable_set instance_variable, value
    end
  end
end

module DirtyObject
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def changes
    p (!@dirty_hash_change ? {} : @dirty_attributes)
  end

  def changed?
    p (!@dirty_hash_change ? false : @dirty_attributes.any?)
  end

  def save
    save_object
  end

  def method_missing(name)
    puts "Undefined method....."
  end
end
