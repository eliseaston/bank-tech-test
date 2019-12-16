require 'transaction'

describe Transaction do

  it 'creates a new transaction in the correct || format for the statement' do
    withdrawal = Transaction.new(100, 0)
    expect(withdrawal.create).to eq("16/12/2019 || || 100.00 || 0.00")
  end

end
