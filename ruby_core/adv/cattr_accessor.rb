# Cattr error
class CattrAccessorError < StandardError
  def initialize(msg = 'Cannot set instance_accessor with instance_reader/writer.')
    super
  end
end
# Module CattrAccessor
module CattrAccessor
  def cattr_accessor(*attributes)
    options = attributes.select { |element| element.is_a? Hash }.first

    raise CattrAccessorError if options_has_reader_writer_with_accessor?(options)
    attributes.each do |attribute|
      next if attribute.is_a? Hash

      class_variable = "@@#{attribute}"
      define_singleton_method("#{attribute}") do
        class_variable_get class_variable
      end

      define_singleton_method("#{attribute}=") do |value|
        class_variable_set class_variable
      end

      if options.nil?
        create_instance_reader_writer(attribute, class_variable)
      else
        create_instance_accessor(attribute, options, class_variable)
      end
    end
  end

  private

  def options_has_reader_writer_with_accessor?(options)
    if !options.nil?
      options.key?(:instance_accessor) && (options.key?(:instance_reader) || options.key?(:instance_writer))
    end
  end

  def create_instance_reader_writer(attribute, class_variable)
    create_instance_reader_method(attribute, class_variable)
    create_instance_writer_method(attribute, class_variable)
  end

  def create_instance_accessor(attribute, options, class_variable)
    if instance_reader_needed?(options)
      create_instance_reader_method(attribute, class_variable)
    end

    if instance_writer_needed?(options)
      create_instance_writer_method(attribute, class_variable)
    end
  end


  def instance_reader_needed?(options)
    options[:instance_accessor] || options[:instance_reader]
  end

  def instance_writer_needed?(options)
    options[:instance_accessor] || options[:instance_writer]
  end

  def create_instance_reader_method(attr, class_variable)
    define_method("#{attr}") do
      self.class.class_variable_get class_variable
    end
  end

  def create_instance_writer_method(attr, class_variable)
    define_method("#{attr}=") do |value|
      self.class.class_variable_set class_variable, value
    end
  end
end

# person class
class Person
  extend CattrAccessor
  cattr_accessor :hair_colors, instance_reader: false, instance_writer: true
end
# male class
class Male < Person
  cattr_accessor :nose
end

# Person.hair_colors = [:brown, :black, :blonde, :red]
# p Person.hair_colors
# # p Person.new.hair_colors = :another

# p Male.hair_colors << :brown

# p Person.hair_colors

p Person.instance_methods.grep /(hair|address)/

p Male.instance_methods.grep /nose/