# frozen_string_literal: true

require 'transaction'

describe Transaction do
  before(:each) do
    @today_date = Time.now.strftime('%d/%m/%Y')
  end

  it 'creates a new withdrawal transaction in the correct || format for the statement' do
    withdrawal = Transaction.new('withdrawal', 100, 0)
    expect(withdrawal.format).to eq("#{@today_date} || || 100.00 || 0.00")
  end

  it 'creates a new deposit transaction in the correct || format for the statement' do
    deposit = Transaction.new('deposit', 100, 100)
    expect(deposit.format).to eq("#{@today_date} || 100.00 || || 100.00")
  end
end
