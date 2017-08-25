code = ["code_blank", "code_not_blank"]
description = ["desc_blank", "desc_not_blank"]
sales = ["sales_checked", "sales_unchecked"]
consulation_discount = ["cons_discount_valid", "cons_discount_invalid"]
referral_discount = ["ref_discount_valid", "ref_discount_invalid"]
redemptions = ["redemption_valid", "redemption_invalid"]

test_cases = code.product(description, sales, consulation_discount, referral_discount, redemptions)
print "#{test_cases.count} test_cases generated"
File.open('admin_coupon.txt', 'w+') do |f2|  
  # use "\n" for two lines of text  
  test_cases.each{ |line| f2.puts line.join(" ,") } 
end 