require 'rails_helper'

RSpec.describe 'the search page' do
  before :each do
    visit '/'
    click_link 'Search Here'
    expect(current_path).to eq('/search')
  end

  it "displays search forms for last name and first name" do
    expect(page).to have_field('last_name')
    expect(page).to have_field('first_name')
  end

  it "displays search forms for last name and state" do
    expect(page).to have_field('last_name')
    expect(page).to have_field('state_initials')
  end

  it "displays search forms for last name and specialty" do
    expect(page).to have_field('state_initials')
    expect(page).to have_field('specialty')
  end
end