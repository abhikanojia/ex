class CattrAccessorError < StandardError
  def initialize(msg = 'Cannot set instance_accessor with instance_reader/writer')
    super
  end
end

class Module

  DEFAULT_OPTIONS = { instance_reader: true, instance_writer: true }

  def cattr_accessor(*attributes)
    options = hash_from_attributes(*attributes) || DEFAULT_OPTIONS
    attributes = symbols_from_hash(*attributes)

    DEFAULT_OPTIONS.merge!(options)
    raise CattrAccessorError if instance_accessor_given?
    attributes.each do |attribute|
      class_variable = "@@#{attribute}"
      define_singleton_method("#{attribute}") do
        class_variable_get class_variable
      end

      define_singleton_method("#{attribute}=") do |value|
        class_variable_set class_variable, value
      end

      create_instance_reader_method(attribute) if DEFAULT_OPTIONS[:instance_reader]
      create_instance_writer_method(attribute) if DEFAULT_OPTIONS[:instance_writer]
    end
  end

  private

  def instance_accessor_given?
    DEFAULT_OPTIONS.key? :instance_accessor
  end

  def symbols_from_hash(*attributes)
    attributes.delete_if{ |element| element.is_a? Hash }
  end

  def hash_from_attributes(*attributes)
    attributes.select { |element| element.is_a? Hash }.first
  end

  def create_instance_reader_method(attr)
    class_variable = "@@#{attr}"
    define_method("#{attr}") do
      self.class.class_variable_get class_variable
    end
  end

  def create_instance_writer_method(attr)
    class_variable = "@@#{attr}"
    define_method("#{attr}=") do |value|
      self.class.class_variable_set class_variable, value
    end
  end
end
# person class
class Person
  cattr_accessor :hair_colors
end
# male class
class Male < Person
  # cattr_accessor :nose
end

Person.hair_colors = [:brown, :black, :blonde, :red]
p Person.hair_colors
# p Person.new.hair_colors = :another

p Male.hair_colors << :brown

p Person.hair_colors
