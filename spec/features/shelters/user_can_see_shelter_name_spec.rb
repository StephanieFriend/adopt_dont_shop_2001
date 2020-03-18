require 'rails_helper'

RSpec.describe "Getting information", type: :feature do
  it "can visit shelters index page and see shelter names" do
    shelter_1 = Shelter.create(name: "Dumb Friends League")
    shelter_2 = Shelter.create(name: "Aurora Animal Shelter")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end