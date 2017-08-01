require 'csv'

file = "employees.csv"

CSV.foreach(file, headers: true) do |row|
  # puts Employee.new(row['Name'], row['EmpId'], row['Designation'])
  # puts "#{row['Name']} #{row['empid']} #{row['desig']}"
  print "#{row['Empid']}"
end
