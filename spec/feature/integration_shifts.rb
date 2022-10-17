# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Creating a shift', type: :feature) do
  it 'valid event id' do
    visit new_shift_path
    fill_in 'Event_id', with: 1
    fill_in 'Shift_Cap', with: 2
    click_on 'New Shift'
    visit shift_path
    expect(page).to(have_content(1))
  end

  it 'valid shift cap' do
    visit new_shift_path
    fill_in 'Event_id', with: 1
    fill_in 'Shift_Cap', with: 2
    click_on 'New Shift'
    visit shift_path
    expect(page).to(have_content(2))
  end
end
