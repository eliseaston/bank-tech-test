require 'account'

describe Account do
  let(:my_account) { described_class.new }

  it 'prints an empty statement when there is no bank activity' do
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n")
  end

  it 'prints one line of activity on the statement when user deposits 100' do
    my_account.deposit(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n16/12/2019 || 100.00 ||  || 100.00")
  end

  it 'prints one line of activity on statement when user withdraws 100' do
    my_account.withdraw(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n16/12/2019 ||  || 100.00 || -100.00")
  end

  it 'prints two lines of activity on statement when user deposits and then withdraws' do
    my_account.deposit(100)
    my_account.withdraw(100)
    expect(my_account.print_statement).to eq("date || credit || debit || balance\n16/12/2019 || 100.00 ||  || 100.00\n16/12/2019 ||  || 100.00 || 0.00")
  end

end
