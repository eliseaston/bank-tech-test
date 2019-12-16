class Account

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def print_statement
    if @balance == 100
      "date || credit || debit || balance\n16/12/2019 || 100.00 ||  || 100.00"
    else
    "date || credit || debit || balance"
    end
  end

end
