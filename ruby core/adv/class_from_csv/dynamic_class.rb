# DynamicClassGenerator generated dynamic classes for given file name and methods
class DynamicClassGenerator
  attr_reader :class_name, :headers

  def initialize(filename, headers)
    class_from_filename = File.basename(filename, '.csv').capitalize!
    @class_name = Class.new { Object.const_set(class_from_filename, self) }
    @headers = headers
  end

  def define_method_in_class(headers)
    class_name.class_eval do |class_name|
      define_method(:initialize) { @file = class_name.to_s.downcase.concat('.csv') }

      headers.each do |method_name|
        define_method(method_name) do
          puts "----#{method_name.capitalize}---"
          CSV.foreach(@file, headers: true) do |row|
            puts row[method_name.to_s]
          end
          puts "----end---"
        end
      end
    end
  end
end