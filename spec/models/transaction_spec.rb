require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'validation test' do
    it 'ensures amount prescence' do
      transaction = Transaction.new(Amount: 19.99)
      expect(transaction.valid?).to eq(false)
    end
  end
  context 'validation test' do
    it 'ensures budget id prescence' do
      transaction = Transaction.new(Budget_id: 1)
      expect(transaction.valid?).to eq(false)
    end
  end
end
