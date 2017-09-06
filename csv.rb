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
    "#{name} (EmpId: #{empid})"
  end
end
# csv read write class
class CSVReader
  def initialize(filename)
    @file = filename
  end

  def read_data
    employees = Hash.new([])
    CSV.foreach(@file, headers: true) do |row|
      employees[row['Designation'].strip] += [Employee.new(row['Name'], row['EmpId'].strip, row['Designation'].strip)]
    end
    employees
  end

  def write_in_other_format(emp_hash, output_file = 'employees.txt')
    file = File.open(output_file, 'w')
    emp_hash.keys.sort.each do |key|
      pluralize_key = key.pluralize if emp_hash[key].length > 1
      file.puts pluralize_key || key
      emp_hash[key].each { |emp| file.puts emp }
      file.puts
    end
  end
end

reader = CSVReader.new('employees.csv')
employee_hash = reader.read_data
reader.write_in_other_format(employee_hash, 'employees.txt')
