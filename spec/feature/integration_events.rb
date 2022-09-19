# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an event', type: :feature do
  scenario 'valid type' do
    visit new_event_path
    fill_in 'Type', with: 1
    fill_in 'Name', with: "Party"
    click_on 'New Event'
    visit new_event_path
    expect(page).to have_content(1)
  end

  scenario 'valid name' do
    visit new_event_path
    fill_in 'Type', with: 1
    fill_in 'Name', with: "Party"
    click_on 'New Event'
    visit event_path
    expect(page).to have_content("Party")
  end

end