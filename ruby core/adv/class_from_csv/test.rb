# Dir.foreach('.') do |item|
#  next if item == '.' || item == '..'
#  p File.extname(item)
# end

require 'csv'

data = CSV.read('person.csv', headers: true)
p data.headers