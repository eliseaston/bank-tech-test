class Transaction

  def initialize(amount, balance)
    @amount = amount
    @balance = balance
  end

  def create
    transaction_data = [Time.now.strftime("%d/%m/%Y "), " ", " %.2f " % @amount, " %.2f" % @balance]
    transaction = transaction_data.join("||")
  end

end
