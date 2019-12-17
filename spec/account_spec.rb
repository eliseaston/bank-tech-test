# frozen_string_literal: true

require 'account'

describe Account do
  let(:my_account) { described_class.new }

  before(:each) do
    @today_date = Time.now.strftime('%d/%m/%Y')
  end

  it 'prints an empty statement when there is no bank activity' do
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n")
  end

  it 'prints one line of activity on the statement when user deposits 100' do
    my_account.deposit(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n#{@today_date} || 100.00 || || 100.00")
  end

  it 'prints one line of activity on statement when user withdraws 100' do
    my_account.withdraw(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n#{@today_date} || || 100.00 || -100.00")
  end

  it 'prints two lines of activity on statement when user deposits and then withdraws' do
    my_account.deposit(100)
    my_account.withdraw(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n#{@today_date} || || 100.00 || 0.00\n#{@today_date} || 100.00 || || 100.00")
  end

  it 'prints statement with multiple deposits and withdrawal, with today date' do
    my_account.deposit(1000)
    my_account.deposit(2000)
    my_account.withdraw(500)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n#{@today_date} || || 500.00 || 2500.00\n#{@today_date} || 2000.00 || || 3000.00\n#{@today_date} || 1000.00 || || 1000.00")
  end
end
