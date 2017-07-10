# Public: Class for printing Vehicles detail.
#
# name  - The Name of customer
# command line argument.
#
# balance  - Account balance, command line argument.
#
# transfer_amount - Transfer from one acc. to another,
# command line argument.
$account_no = 0
class Account
  attr_reader :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
    $account_no = $account_no + 1
  end

  def to_s
    "Account number: #$account_no\nAccount holder name: #{name}\nAccount balance: #{balance}"
  end

  def withdraw(amount)
    @balance -= amount
  end

  def deposit(amount)
    @balance += amount
  end
end

if ARGV[0].nil? || ARGV[1].nil? || ARGV[2].nil?
  print 'Please provide an input'
else


  person1 = ARGV[0].split(/:/)
  person2 = ARGV[1].split(/:/)

  account_a = Account.new(person1[0], person1[1].to_i)
  #account_b = Account.new(person2[0], person2[1].to_i)

  puts account_a
  # amount = ARGV[2].split(/:/)[1].to_i

  # account_a.withdraw(amount)
  # account_b.deposit(amount)

  # puts account_a
  # print "\n"
  # print account_b
end
