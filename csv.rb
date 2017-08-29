require 'csv'
# Public - Method process for processing input file
class String
  def pluralize
    dup << 's'
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
# csv read write class
class CSVReader
  def initialize(filename)
    @file = filename
  end

  def read_data
    employees = []
    CSV.foreach(@file, headers: true) do |row|
      employee = Employee.new(row[0], row[1].strip, row[2].strip)
      employees.push(employee)
    end
    employees.group_by(&:desig)
  end

  def write_in_other_format(emp_hash, output_file = 'employees.txt')
    file = File.open(output_file, 'w')
    emp_hash.sort.to_h.each do |key, value|
      key = key.pluralize if value.length > 1
      file.puts key
      value.each { |emp| file.puts "#{emp.name} EmpId: (#{emp.empid})" }
      file.puts
    end
  end
end

reader = CSVReader.new('employees.csv')
employee_hash = reader.read_data
reader.write_in_other_format(employee_hash, 'employees.txt')
