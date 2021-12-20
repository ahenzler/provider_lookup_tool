require 'rails_helper'

RSpec.describe 'the search page' do
  before :each do
    visit '/'
    click_link 'Search Here'
    expect(current_path).to eq('/api/v1/search')
  end

  it 'displays search results for last name and first name' do
    within '.last_name_first_name' do
      fill_in 'first_name', with: 'mark'
      fill_in 'last_name', with: 'henzler'
      click_button 'Search'
    end

    expect(page).to have_content('Search Results')
    expect(page).to have_content('Provider:')
    expect(page).to have_content('MARK HENZLER')
    expect(page).to have_content('Contact Information:')
    expect(page).to have_content('1055 N CURTIS RD, BOISE, ID, 837061352, 208-322-1730')
    expect(page).to have_content('NPI Number:')
    expect(page).to have_content('208-322-1730')

  end

  it 'displays search results for last name and state' do
    within '.last_name_state' do
      fill_in 'last_name', with: 'henzler'
      fill_in 'state_initials', with: 'ID'
      click_button 'Search'
    end

    expect(page).to have_content('Search Results')
    expect(page).to have_content('Provider:')
    expect(page).to have_content('MARK HENZLER')
    expect(page).to have_content('Contact Information:')
    expect(page).to have_content('1055 N CURTIS RD, BOISE, ID, 837061352, 208-322-1730')
    expect(page).to have_content('NPI Number:')
    expect(page).to have_content('208-322-1730')
  end

  it 'displays search results for last name and specialty' do
    within '.state_specialty' do
      fill_in 'state_initials', with: 'ID'
      fill_in 'specialty', with: 'Emergency Medicine'
      click_button 'Search'
    end

    expect(page).to have_content('Search Results')
    expect(page).to have_content('Provider:')
    expect(page).to have_content('Contact Information:')
    expect(page).to have_content('NPI Number:')
  end
end