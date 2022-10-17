require 'rails_helper'

RSpec.describe(Event, type: :model) do
  context 'validation test' do
    it 'ensures type prescence' do
      event = Event.new(Name: 'Meeting', Start: Date.parse('09/10/2000'))
      expect(event.valid?).to(eq(false))
    end
  end

  context 'validation test' do
    it 'ensures name prescence' do
      event = Event.new(Type: 1, Start: Date.parse('09/10/2000'))
      expect(event.valid?).to(eq(false))
    end
  end

  context 'validation test' do
    it 'ensures start prescence' do
      event = Event.new(Name: 'Meeting', Type: 1)
      expect(event.valid?).to(eq(false))
    end
  end
end
