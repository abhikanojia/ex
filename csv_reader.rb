# Including CSV library
require 'csv'
# Public - Method process for processing input file
class String
  def pluralize
    self << 's'
  end
end
# for each employee listed in csv
class Employee
  attr_reader :name, :empid, :desig
  def initialize(name, empid, desig)
    @name = name
    @empid = empid
    @desig = desig
  end

  def to_s
    "Name: #{@name} Employee id: #{@empid} and Designation: #{@desig}"
  end
end
# for writting in another format
class CSVReader
  def initialize(filename, output_file)
    @filename = filename
    @designation_group = Hash.new([])
    @output_file = output_file
    @employees = []
    @pluralized_hash = Hash.new([])
  end

  def process
    CSV.foreach(@filename, headers: true) do |row|
      arr = row.to_s.parse_csv
      new_employee = Employee.new(arr[0], arr[1].to_i, arr[2].chop.lstrip)
      @designation_group[row[2].strip] += [new_employee.name.strip + "(EmpId: #{new_employee.empid})"]
    end
    create_hash_group_and_write_to_file
  end

  private

  def create_hash_group_and_write_to_file
    @designation_group = @designation_group.sort.to_h
    @designation_group.each do |key, value|
      designation = key.dup
      designation.pluralize if value.length > 1
      @pluralized_hash[designation] = value
    end
    write_in_another_format
  end

  def write_in_another_format
    File.open(@output_file, 'w+') do |file|
      @pluralized_hash.each do |key, _|
        file.puts key.to_s
        @pluralized_hash[key].each do |val|
          file.puts val
        end
        file.puts
      end
    end
  end
end

puts 'Processing....'
reader = CSVReader.new('employees.csv', 'employees.txt')
reader.process
puts 'File is ready to be used'
