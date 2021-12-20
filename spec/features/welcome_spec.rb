require 'rails_helper'

RSpec.describe "welcome page" do
  before :each do
    visit '/'
  end

  it 'shows a welcome message' do
    expect(page).to have_content("Here to help you find a provider in your area for your medical needs.")
  end

  it 'has a link to search here' do
    click_link 'Search Here'

    expect(current_path).to eq('/api/v1/search')
  end
end