# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Creating an attendance', type: :feature) do
  it 'valid member id' do
    visit attendance
    fill_in 'Member_id', with: 1
    fill_in 'Shift_id', with: 2
    fill_in 'Hours', with: 3.5
    click_on 'New Attendance'
    visit attendances
    expect(page).to(have_content(1))
  end

  it 'valid shift id' do
    visit attendance
    fill_in 'Member_id', with: 1
    fill_in 'Shift_id', with: 2
    fill_in 'Hours', with: 3.5
    click_on 'New Attendance'
    visit attendances
    expect(page).to(have_content(2))
  end

  it 'valid hours' do
    visit attendance
    fill_in 'Member_id', with: 1
    fill_in 'Shift_id', with: 2
    fill_in 'Hours', with: 3.5
    click_on 'New Attendance'
    visit attendances
    expect(page).to(have_content(3.5))
  end
end
