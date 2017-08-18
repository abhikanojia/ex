# Including CSV library
require 'csv'
# Public - Method process for processing input file
class String
  def pluralize
    self << 's'
  end
end

class Employee
  attr_reader :name, :empid, :desig
  def initialize(name, empid, desig)
    @name = name
    @empid = empid
    @desig = desig
  end
end

# for writting in another format
class CSVreader
  def initialize(filename, output_file)
    @filename = filename
    @designation_group = Hash.new([])
    @output_file = output_file
    @employees = []
  end

  def process
    @new_hash = Hash.new([])
    CSV.foreach(@filename, headers: true) do |row|
      arr = row.to_s.split(',')
      @employees << Employee.new(arr[0], arr[1].to_i, arr[2].chop.lstrip)
      @designation_group[@employees.desig] += [@employees.strip + "(EmpId: #{@employees.empid}"]
      # @designation_group[row[2].strip] += [row[0].strip + "(EmpId: #{row[1]})"]
    end
    p @designation_group
    # create_hash_group
  end

  private

  def create_hash_group
    @designation_group = @designation_group.sort.to_h
    @designation_group.each do |key, value|
      designation = key.dup
      designation.pluralize if value.length > 1
      @new_hash[designation] = value
    end
    write_in_another_format
  end

  def write_in_another_format
    File.open(@output_file, 'w+') do |file|
      @new_hash.each do |key, _|
        file.puts key.to_s
        @new_hash[key].each do |val|
          file.puts val
        end
        file.puts
      end
    end
  end
end

puts 'Processing....'
reader = CSVreader.new('employees.csv', 'employee.txt')
reader.process
# puts 'File is ready to be used'
