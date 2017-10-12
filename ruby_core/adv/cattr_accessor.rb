# Invalid Argument
class InvalidArgument < ArgumentError
  def initialize(msg = 'Invalid Argument provided for cattr_accessor. Argument must be Symbol')
    super
  end
end
# Cattr error
class CattrAccessorError < StandardError
  def initialize(msg = 'Cannot set instance_accessor with instance_reader/writer.')
    super
  end
end
# Module CattrAccessor
module CattrAccessor

  def cattr_accessor(*attributes)
    raise InvalidArgument if !valid_attributes(*attributes)
    options = attributes.select { |element| element.is_a? Hash }.first

    raise CattrAccessorError if options_has_reader_writer_with_accessor?(options)
    attributes.each do |attribute|
      next if attribute.is_a? Hash

      class_variable = "@@#{attribute}"

      create_class_reader(attribute)
      create_class_writer(attribute)

      if options_given?(options)
        create_instance_accessor(attribute)
      else
        create_instance_reader_method(attribute) if instance_reader_needed?(options)
        create_instance_writer_method(attribute) if instance_writer_needed?(options)
      end
    end
  end

  private

  def options_given?(options)
    options.nil? || options.empty?
  end

  def valid_attributes(*arguments)
    arguments.all? { |argument| [Hash, Symbol].include? argument.class }
  end

  def create_class_reader(argument)
    define_singleton_method("#{argument}") do
      class_variable_get class_variable
    end
  end

  def create_class_writer(argument)
    define_singleton_method("#{argument}=") do |value|
      class_variable_set class_variable
    end
  end

  def options_has_reader_writer_with_accessor?(options)
    if !options_given?(options)
      options.key?(:instance_accessor) && (options.key?(:instance_reader) || options.key?(:instance_writer))
    end
  end

  def create_instance_accessor(attribute)
    create_instance_reader_method(attribute)
    create_instance_writer_method(attribute)
  end

  def instance_reader_needed?(options)
    options[:instance_accessor] || options[:instance_reader]
  end

  def instance_writer_needed?(options)
    options[:instance_accessor] || options[:instance_writer]
  end

  def create_instance_reader_method(attr)
    define_method("#{attr}") do
      self.class.class_variable_get class_variable
    end
  end

  def create_instance_writer_method(attr)
    define_method("#{attr}=") do |value|
      self.class.class_variable_set class_variable, value
    end
  end
end

# person class
class Person
  extend CattrAccessor
  cattr_accessor :hair_colors, instance_writer: true, instance_reader: false
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