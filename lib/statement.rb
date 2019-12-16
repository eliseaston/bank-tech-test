class Statement

  def initialize
    @transaction_history = []
  end

  def add(transaction)
    @transaction_history.push(transaction)
  end

  def print
    header = "date || credit || debit || balance"
    printed_statement = @transaction_history.reverse.join("\n")
    "#{header}\n#{printed_statement}"
  end

end
