require 'account'

describe Account do
  let(:my_account) { described_class.new }

  it 'prints an empty statement when there is no bank activity' do
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n")
  end

  it 'prints one line of activity on the statement when user deposits 100' do
    my_account.deposit(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n16/12/2019 || 100.00 || || 100.00")
  end

  it 'prints one line of activity on statement when user withdraws 100' do
    my_account.withdraw(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n16/12/2019 || || 100.00 || -100.00")
  end

  it 'prints two lines of activity on statement when user deposits and then withdraws' do
    my_account.deposit(100)
    my_account.withdraw(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n16/12/2019 || || 100.00 || 0.00\n16/12/2019 || 100.00 || || 100.00")
  end

  it 'prints statement from acceptance criteria with multiple deposits and withdrawal with today date' do
    my_account.deposit(1000)
    my_account.deposit(2000)
    my_account.withdraw(500)
    # expect(my_account.print_statement).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n16/12/2019 || || 500.00 || 2500.00\n16/12/2019 || 2000.00 || || 3000.00\n16/12/2019 || 1000.00 || || 1000.00")

  end

end
