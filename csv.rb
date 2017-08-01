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

class CSVreader
  attr_accessor :data

  def initialize(filename)
    @file = filename
    @employees = []
    @data = []
  end

  def read_data
    require 'csv'
    CSV.foreach(@file, headers: true) do |row|
      arr = row.to_s.split(',')
      @employees << Employee.new(arr[0], arr[1].to_i, arr[2].chop.lstrip)
    end
  end

  def emps
    file = File.open('newformat_emp.txt','w')
    @employees.sort_by { |obj| obj.desig }.each do |emp|
      @data[emp.desig.to_s] = emp.name
    end
    print @data
  end
end

reader = CSVreader.new('employees.csv')
reader.read_data
reader.emps
