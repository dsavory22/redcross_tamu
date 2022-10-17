require 'rails_helper'

RSpec.describe(Budget, type: :model) do
  context 'validation test' do
    it 'ensures total amount prescence' do
      budget = Budget.new
      expect(budget.valid?).to(eq(false))
    end
  end
end
