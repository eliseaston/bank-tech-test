# frozen_string_literal: true

require 'statement'
require 'transaction'

describe Statement do
  it 'prints a statement after adding a deposit to the transaction history' do
    statement = Statement.new
    deposit = instance_double('Transaction', format: '10/01/2012 || 1000.00 || || 1000.00')
    statement.add(deposit.format)
    expect(statement.print).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
  end

  it 'prints the statement from the acceptance criteria, with 2012 transaction dates' do
    statement = Statement.new

    deposit_1000 = instance_double('Transaction', format: '10/01/2012 || 1000.00 || || 1000.00')
    deposit_2000 = instance_double('Transaction', format: '13/01/2012 || 2000.00 || || 3000.00')
    withdraw_500 = instance_double('Transaction', format: '14/01/2012 || || 500.00 || 2500.00')

    statement.add(deposit_1000.format)
    statement.add(deposit_2000.format)
    statement.add(withdraw_500.format)

    expect(statement.print).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
  end
end
