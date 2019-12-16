require 'statement'
require 'transaction'

describe Statement do

  it 'prints a statement after adding a deposit to the transaction history' do
    statement = Statement.new
    deposit = Transaction.new("deposit", 1000, 1000, "10/01/2012")
    statement.add(deposit.create)
    expect(statement.print).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
  end

  it 'prints the statement from the acceptance criteria, with 2012 transaction dates' do
    statement = Statement.new
    deposit_1000 = Transaction.new("deposit", 1000, 1000, "10/01/2012")
    deposit_2000 = Transaction.new("deposit", 2000, 3000, "13/01/2012")
    withdraw_500 = Transaction.new("withdrawal", 500, 2500, "14/01/2012")
    statement.add(deposit_1000.create)
    statement.add(deposit_2000.create)
    statement.add(withdraw_500.create)
    expect(statement.print).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
  end

end
