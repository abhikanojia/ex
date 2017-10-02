# Dir.foreach('.') do |item|
#  next if item == '.' || item == '..'
#  p File.extname(item)
# end

require 'csv'

CSV.foreach('person.csv', headers: true) do |row|
  print row['name']
end

# def print_data(row)
#   row.each do |r|
#     print r['name']
#   end
# end


# p data

# print_data(data)
