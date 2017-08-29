firstname = ["firstname_valid", "firstname_invalid"]
lastname = ["lastname_valid", "lastname_invalid"]
role = ["role_selected", "role_not_selected"]
email = ["email_valid", "email_invalid"]


test_cases = firstname.product(lastname, role, email)
puts "#{test_cases.count} test_cases generated"
File.open('testcases/new_user.txt', 'w+') do |f2|  
  # use "\n" for two lines of text  
  test_cases.each{ |line| f2.puts line.join(" ,") } 
end 