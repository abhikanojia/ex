string = "I have $10 and $20"

p string.gsub(/\$(\d\d)/, "\1 dollars")