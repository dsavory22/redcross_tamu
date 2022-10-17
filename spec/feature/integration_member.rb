# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Creating a member', type: :feature) do
  it 'valid first name' do
    visit new_member_path
    fill_in 'First name', with: 'Aaron'
    fill_in 'Last name', with: 'Calderon'
    fill_in 'Email', with: 'Aaron54637@tamu.edu'
    # fill_in 'Fall dues', with: "False"
    # fill_in 'Spring dues', with: 'False'
    fill_in 'Shirt size', with: 'M'
    fill_in 'Year', with: 2023
    click_on 'Create Member'
    visit members_path
    expect(page).to(have_content('Aaron54637@tamu.edu'))
  end

  it 'valid last name' do
    visit new_member_path
    fill_in 'title', with: 'Aaron'
    fill_in 'First_Name', with: 'Aaron'
    fill_in 'Last_Name', with: 'Calderon'
    fill_in 'Email', with: 'Aaron54637@tamu.edu'
    fill_in 'Fall_Dues', with: 'False'
    fill_in 'Spring_Dues', with: 'False'
    fill_in 'Shirt_Size', with: 'M'
    fill_in 'year', with: 2023
    click_on 'New Member'
    visit members_path
    expect(page).to(have_content('Calderon'))
  end

  it 'valid email' do
    visit new_member_path
    fill_in 'First_Name', with: 'Aaron'
    fill_in 'Last_Name', with: 'Calderon'
    fill_in 'Email', with: 'Aaron54637@tamu.edu'
    fill_in 'Fall_Dues', with: 'False'
    fill_in 'Spring_Dues', with: 'False'
    fill_in 'Shirt_Size', with: 'M'
    fill_in 'year', with: 2023
    click_on 'New Member'
    visit members_path
    expect(page).to(have_content('Aaron54637@tamu.edu'))
  end

  it 'valid class year' do
    visit new_member_path
    fill_in 'First_Name', with: 'Aaron'
    fill_in 'Last_Name', with: 'Calderon'
    fill_in 'Email', with: 'Aaron54637@tamu.edu'
    fill_in 'Fall_Dues', with: 'False'
    fill_in 'Spring_Dues', with: 'False'
    fill_in 'Shirt_Size', with: 'M'
    fill_in 'year', with: 2023
    click_on 'New Member'
    visit members_path
    expect(page).to(have_content(2023))
  end
end
