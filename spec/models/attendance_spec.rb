require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'validation test' do
    it 'ensures start prescence' do
      attendance = Attendance.new(Member_id: 1, Shift_id: 2)
      expect(attendance.valid?).to eq(false)
    end
  end
  context 'validation test' do
    it 'ensures member id' do
      attendance = Attendance.new(Shift_id: 2)
      expect(attendance.valid?).to eq(false)
    end
  end
  context 'validation test' do
    it 'ensures shift id prescence' do
      attendance = Attendance.new(Member_id: 1)
      expect(attendance.valid?).to eq(false)
    end
  end
end
