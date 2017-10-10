class CattrAccessorError < StandardError
  def initialize(msg = "Cannot set instance_accessor to false with instance_reader/writer")
    super
  end
end

class Module

  DEFAULT_OPTIONS = { instance_reader: true, instance_writer: true, instance_accessor: true }

  def cattr_accessor(*attributes)
    options = hash_from_attributes(*attributes) || DEFAULT_OPTIONS
    attributes = symbols_from_hash(*attributes)

    DEFAULT_OPTIONS.merge!(options)
    raise CattrAccessorError if !DEFAULT_OPTIONS[:instance_accessor]
    attributes.each do |attr|
      cls_var = "@@#{attr}"
      define_singleton_method("#{attr}") do
        class_variable_get cls_var
      end

      define_singleton_method("#{attr}=") do |value|
        class_variable_set cls_var, value
      end
      create_instance_reader_method(attr) if DEFAULT_OPTIONS[:instance_reader] || DEFAULT_OPTIONS[:instance_accessor]
      create_instance_writer_method(attr) if DEFAULT_OPTIONS[:instance_writer] || DEFAULT_OPTIONS[:instance_accessor]
    end
  end

  private

  def symbols_from_hash(*attributes)
    attributes.delete_if{ |element| element.is_a? Hash }
  end

  def hash_from_attributes(*attributes)
    return attributes.select { |x| x.is_a? Hash }.first
  end

  def create_instance_reader_method(attr)
    ins_var = "@@#{attr}"
    define_method("#{attr}") do
      self.class.class_variable_get ins_var
    end
  end

  def create_instance_writer_method(attr)
    ins_var = "@@#{attr}"
    define_method("#{attr}=") do |value|
      class_variable_set ins_var, value
    end
  end
end

class Person
  cattr_accessor :hair_colors, :address, instance_accessor: true
end

class Male < Person
  cattr_accessor :eye_color
end



Person.hair_colors = [:brown, :black, :blonde, :red]
p Person.hair_colors
p Person.new.hair_colors


p Male.hair_colors << :blonde

p Person.hair_colors


Person.address = "patel nagar new delhi"
p Person.address

p Person.instance_methods.grep /hair/
p Male.instance_methods.grep /eye_color/
