# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

class Account

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    @balance += amount
    deposit = Transaction.new("deposit", amount, @balance).format
    @statement.add(deposit)
  end

  def withdraw(amount)
    @balance -= amount
    withdrawal = Transaction.new("withdrawal", amount, @balance).format
    @statement.add(withdrawal)
  end

  def print_statement
    @statement.print
  end

end
