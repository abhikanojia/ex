# Public: Class for printing Account detail.
class Account
  attr_reader :name, :account_no
  attr_accessor :balance

  @@count = 0

  def initialize(name, balance)
    @name = name
    @balance = balance
    if @@count.zero?
      @account_no = 1
      @@count += 1
    else
      @@count += 1
      @account_no = @@count
    end
  end

  def transfer(to_account, amount)
    from_account = self
    if from_account.balance >= amount
      withdraw(from_account, amount)
      deposit(to_account, amount)
    end
  end

  def to_s
    "Account number: #{account_no}\nAccount holder name: #{name}\n" \
    "Account balance: #{balance}"
  end

  private

  def withdraw(account, amount)
    account.balance -= amount
  end

  def deposit(account, amount)
    account.balance += amount
  end
end

if ARGV[0].nil? || ARGV[1].nil? || ARGV[2].nil?
  print 'Please provide an input'
else
  person1 = ARGV[0].split(/:/)
  person2 = ARGV[1].split(/:/)

  account_a = Account.new(person1[0].to_s, person1[1].to_i)
  account_b = Account.new(person2[0].to_s, person2[1].to_i)

  amount = ARGV[2].split(/:/)[1].to_i

  account_a.transfer(account_b, amount)

  puts account_a
  print "\n"
  print account_b
end
