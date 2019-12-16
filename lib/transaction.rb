class Transaction

  def initialize(trans_type, amount, balance)
    @trans_type = trans_type
    @amount = amount
    @balance = balance
  end

  def create
    if @trans_type == "withdrawal"
      transaction_data = [Time.now.strftime("%d/%m/%Y "), " ", " %.2f " % @amount, " %.2f" % @balance]
    elsif @trans_type == "deposit"
      transaction_data = [Time.now.strftime("%d/%m/%Y "), " %.2f " % @amount, " ", " %.2f" % @balance]
    end
    transaction = transaction_data.join("||")
  end

end
