require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can create a shelter" do

    visit '/shelters'
    click_link "New Shelter"

    expect(current_path).to eq('/shelters/new')
    fill_in :name, with: "Animal House"
    fill_in :address, with: "123 place"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80112"

    click_button "Create Shelter"

    expect(current_path).to eq('/shelters')
    expect(page).to have_content("Animal House")
  end
end

