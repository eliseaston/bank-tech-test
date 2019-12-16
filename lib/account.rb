require_relative 'transaction'

class Account

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    deposit = Transaction.new("deposit", amount, @balance)
    @statement.push(deposit.create)
  end

  def withdraw(amount)
    @balance -= amount
    withdrawal = Transaction.new("withdrawal", amount, @balance)
    @statement.push(withdrawal.create)
  end

  def print_statement
    printed_statement = @statement.reverse.join("\n")
    "date || credit || debit || balance\n#{printed_statement}"
  end

end
