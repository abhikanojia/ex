require 'csv'

headers = ["User Type", "Order Type", "Wallet_amount", "Organized by", "Recepients", "Expected", "Pass/Fail"]

user_type = ["newuser", "member", "lead"]

wallet = [0, 20, 30]

organised_by = ["new_organiser", "member_organiser"]

recepients = ["all_new", "both_member", "one_new", "one_member"]

order_type = ["split", "organiser_pays", "partial:0", "partial:10"]

test_cases = user_type.product(order_type, wallet, organised_by, recepients)

puts "Generating test cases....."

print "Total cases generated: #{test_cases.length}\n file is ready to be used.."

CSV.open("test.csv","w") do |row|
  row << headers
  test_cases.each do |val|
    row << val
  end
end

