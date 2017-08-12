names_with_ages = [["john", 20, 10], ["peter", 30, 20], ["david", 40, 30], ["angel", 24, 50]]

names_with_ages.each { |name, age, t| puts name.ljust(10) + age.to_s.ljust(10) + t.to_s }
