class Transaction

  def initialize(trans_type, amount, balance, date=Time.now)
    @trans_type = trans_type
    @amount = amount
    @balance = balance
    @date = date.strftime("%d/%m/%Y")
  end

  def create
    if @trans_type == "withdrawal"
      transaction_data = ["#{@date} ", " ", " %.2f " % @amount, " %.2f" % @balance]
    elsif @trans_type == "deposit"
      transaction_data = ["#{@date} ", " %.2f " % @amount, " ", " %.2f" % @balance]
    end
    transaction = transaction_data.join("||")
  end

end
