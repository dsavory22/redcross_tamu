require 'rails_helper'

RSpec.describe(Shift, type: :model) do
  context 'validation test' do
    it 'ensures event id prescence' do
      shift = Shift.new
      expect(shift.valid?).to(eq(false))
    end
  end
end
