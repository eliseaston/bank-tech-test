require 'account'

describe Account do

  it 'prints an empty statement when there is no bank activity' do
    my_account = Account.new
    expect(my_account.print_statement).to eq("date || credit || debit || balance")
  end

  it 'prints one line of activity on the statement when user deposits 100' do
    my_account = Account.new
    my_account.deposit(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n16/12/2019 || 100.00 ||  || 100.00")
  end

end
