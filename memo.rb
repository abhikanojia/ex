def full_name
  @full ||= "#{@firstname} #{@lastname}"
end
@firstname ="Abhishek"
@lastname = "Kanojia"

puts full_name

@firstname ="Mayank"
@lastname = "Kanojia"

puts full_name