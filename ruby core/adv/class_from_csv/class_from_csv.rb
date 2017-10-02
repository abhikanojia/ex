# include csv library
require 'csv'

# include csv reader class
require_relative 'csv_reader'

# include dynamic class creator
require_relative 'dynamic_class'

#include directory files reader
require_relative 'directory_reader'

# current directory instance
current_directory = ReadDirectory.new('.')

# read all csv files in current directory
current_directory.csv_files.each do |filename|
  csv = CSVReader.new(filename)
  dynamic_class = DynamicClassGenerator.new(filename, csv.read_headers)
  dynamic_class.define_method_in_class(csv.read_headers)
end


# Accessing data from generated classes
customer = Person.new

p Person.instance_methods(false)

customer.name

customer.age

customer.city

puts

shopping_items = Items.new

shopping_items.name

shopping_items.availablity


shopping_items.price
