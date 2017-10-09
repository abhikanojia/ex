class Module
  def cattr_accessor(*attributes)
    p symbol_methods = Hash.new(0)
    p attributes.first
    symbol_methods[attributes.first] = attributes[1].keys
    exit
    # if options_has_accessor_with_reader_writer?(options)
    #   abort 'Error Occured'
    # end

    attributes.each do |attr|
      cls_var = "@@#{attr}"

      define_singleton_method("#{attr}") do
        class_variable_get cls_var
      end

      define_singleton_method("#{attr}=") do |value|
        class_variable_set cls_var, value
      end

      create_instance_reader_method(attr) if options[:instance_reader]

      create_instance_writer_method(attr) if options[:instance_writer]
    end
  end

  private

  def options_has_accessor_with_reader_writer?(options)
    if options.keys.include? :instance_accessor
      # check if keys has instance_reader/writer
      options.none? { |x| x == :instance_reader || x == :instance_writer }
    end
  end

  def create_instance_reader_method(attr)
    ins_var = "@@#{attr}"
    define_method("#{attr}") do
      self.class.class_variable_get ins_var
    end

    define_method("#{attr}=") do |value|
      self.class.class_variable_set ins_var, value
    end
  end

  def create_instance_writer_method(attr)
    ins_var = "@@#{attr}"
    define_method("#{attr}") do
      class_variable_get ins_var
    end

    define_method("#{attr}=") do |value|
      class_variable_set ins_var, value
    end
  end
end

class Person
  cattr_accessor :hair_colors, instance_writer: false, instance_reader: true
  # cattr_accessor :hair_colors, instance_accessor: false
  cattr_accessor :colors, instance_accessor: true
end

Person.hair_colors = [:brown, :black, :blonde, :red]
p Person.hair_colors
p Person.new.hair_colors

# p Person.singleton_methods
# p Person.instance_methods