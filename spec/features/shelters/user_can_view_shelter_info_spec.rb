require 'rails_helper'

RSpec.describe "Viewing shelter information", type: :feature do
  it "can visit shelters show page and see shelter information" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                               address: "2080 S Quebec St",
                               city: "Denver",
                               state: "CO",
                               zip: "80231")
    shelter_2 = Shelter.create(name: "Aurora Animal Shelter",
                               address: "15750 E 32nd Ave",
                               city: "Aurora",
                               state: "CO",
                               zip: "80011")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_2.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_2.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_2.state)
    expect(page).to have_content(shelter_1.zip)
    expect(page).to have_content(shelter_2.zip)
  end
end