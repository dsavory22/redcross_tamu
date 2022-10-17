require 'rails_helper'

RSpec.describe(Member, type: :model) do
  context 'validation test' do
    it 'ensures first name prescence' do
      member = Member.new(Last_Name: 'last', Email: 'email@tamu.edu')
      expect(member.valid?).to(eq(false))
    end
  end

  context 'validation test' do
    it 'ensures last name prescence' do
      member = Member.new(First_Name: 'first', Email: 'email@tamu.edu')
      expect(member.valid?).to(eq(false))
    end
  end
end
