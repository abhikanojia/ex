# Account class for fund transfer
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

  def to_s
    "Account number: #{account_no}\nAccount holder name: #{name}\n" \
    "Account balance: #{balance}"
  end
end
# FundTransfer class transact the amount using transfer function
class FundTransfer
  def initialize(account_a, account_b)
    @account_a = account_a
    @account_b = account_b
  end

  def transfer(amount)
    if @account_a.balance >= amount
      withdraw(@account_a, amount)
      deposit(@account_b, amount)
    end
  end

  private

  def deposit(account, amount)
    account.balance += amount
  end

  def withdraw(account, amount)
    account.balance -= amount
  end
end

if ARGV[0].nil? || ARGV[1].nil? || ARGV[2].nil?
  print 'Please provide an input'
  exit
else
  customer1 = ARGV[0].split(/:/)
  customer2 = ARGV[1].split(/:/)
  # transfer amount from account 1 to account 2 ignoring negative values
  transfer_amount = ARGV[2].split(/:/)[1].to_i.abs

  customer1 = Account.new(customer1[0].to_s, customer1[1].to_i)
  customer2 = Account.new(customer2[0].to_s, customer2[1].to_i)

  # transfer
  process = FundTransfer.new(customer1, customer2)
  process.transfer(transfer_amount)

  puts customer1
  print "\n"
  print customer2
end
