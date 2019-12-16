require_relative 'transaction'
require_relative 'statement'

class Account

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    @balance += amount
    deposit = Transaction.new("deposit", amount, @balance)
    @statement.add(deposit.create)
  end

  def withdraw(amount)
    @balance -= amount
    withdrawal = Transaction.new("withdrawal", amount, @balance)
    @statement.add(withdrawal.create)
  end

  def print_statement
    @statement.print
  end

end
