class Account

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    transaction_data = [Time.now.strftime("%d/%m/%Y "), " %.2f " % amount, " ", " %.2f" % @balance]
    transaction = transaction_data.join("||")
    @statement.push(transaction)
  end

  def withdraw(amount)
    @balance -= amount
    transaction_data = [Time.now.strftime("%d/%m/%Y "), " ", " %.2f " % amount, " %.2f" % @balance]
    transaction = transaction_data.join("||")
    @statement.push(transaction)
  end

  def print_statement
    printed_statement = @statement.join("\n")
    "date || credit || debit || balance\n#{printed_statement}"
  end

end
