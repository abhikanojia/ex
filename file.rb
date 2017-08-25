require 'csv'

headers = ["User Type", "Order Type", "Wallet_amount", "Organized by", "Recepients", "Expected", "Pass/Fail"]

card = ["card_valid", "card_invalid", "card_blank"]

cvc = ["cvc_valid", "cvc_invalid", "cvc_blank"]


test_cases = user_type.product(order_type, wallet, organised_by, recepients)

puts "Generating test cases....."

print "Total cases generated: #{test_cases.length}\n file is ready to be used.."

CSV.open("card.csv","w") do |row|
  row << headers
  test_cases.each do |val|
    row << val
  end
end

