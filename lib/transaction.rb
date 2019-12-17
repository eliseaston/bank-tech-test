# frozen_string_literal: true

class Transaction
  def initialize(trans_type, amount, balance, date = Time.now.strftime('%d/%m/%Y'))
    @trans_type = trans_type
    @amount = amount
    @balance = balance
    @date = date
  end

  def format
    if @trans_type == 'withdrawal'
      transaction_data = ["#{@date} ", ' ', format(' %.2f ', @amount), format(' %.2f', @balance)]
    elsif @trans_type == 'deposit'
      transaction_data = ["#{@date} ", format(' %.2f ', @amount), ' ', format(' %.2f', @balance)]
    end
    transaction = transaction_data.join('||')
  end
end
