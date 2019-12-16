require 'statement'

describe Statement do

  it 'prints a statement after adding a deposit to the transaction history' do
    statement = Statement.new
    deposit = Transaction.new("deposit", 1000, 1000, "10/01/2012")
    statement.add(deposit.create)
    expect(statement.print).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
  end

end
