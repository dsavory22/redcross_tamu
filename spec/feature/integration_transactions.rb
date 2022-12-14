# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a transaction', type: :feature do
  scenario 'valid budget id' do
    visit new_transaction_path
    fill_in 'Budget_id', with: 1
    fill_in 'Amount', with: 2
    click_on 'New transaction'
    visit transaction_path
    expect(page).to have_content(1)
  end

  scenario 'valid amount' do
    visit new_transaction_path
    fill_in 'Budget_id', with: 1
    fill_in 'Amount', with: 2
    click_on 'New transaction'
    visit transaction_path
    expect(page).to have_content(2)
  end

  scenario 'valid date' do
    visit new_transaction_path
    fill_in 'Budget_id', with: 1
    fill_in 'Amount', with: 2
    click_on 'New transaction'
    visit transaction_path
    expect(page).to have_content(2022)
  end

end