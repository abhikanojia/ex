# Public - Method process for processing input file
class String
  def pluralize
    self << 's'
  end
end
# employee
class Employee
  attr_reader :name, :empid, :desig
  def initialize(name, empid, desig)
    @name = name
    @empid = empid
    @desig = desig
  end

  def to_s
    "Name: #{name} Employee id: #{empid} and Designation: #{desig}"
  end
end
require 'csv'
class CSVReader
  attr_accessor :data

  def initialize(filename)
    @file = filename
    @employees = []
  end

  def read_data
   data_array  = CSV.read(@file, headers: true)
   data_array.group_by { |i| i['Designation'] }.each do |key, value|
    # key.pluralize if key.value.length > 1
    # puts key << 's' if
    p key.value
   end 
    # CSV.read(@file, headers: true) do |row|
    #   p row
    #   #@employees << Employee.new(row[0], row[1].to_i, row[2])
    #   # @employees << Employee.new(arr[0], arr[1].to_i, arr[2].chop.lstrip)
    # end
   # @employees
  end

  def emps
    file = File.open('newformat_emp.txt','w')
    @employees.sort_by { |obj| obj.desig }.each do |emp|
      @data[emp.desig.to_s] = emp.name
    end
    print @data
  end
end

reader = CSVReader.new('employees.csv')
print reader.read_data
# reader.emps
