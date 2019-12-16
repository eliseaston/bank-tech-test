class Statement

  def initialize
    @transaction_history = []
  end

  def add(transaction)
    @transaction_history.push(transaction)
  end

  def print
    printed_statement = @transaction_history.reverse.join("\n")
    "date || credit || debit || balance\n#{printed_statement}"
  end

end
