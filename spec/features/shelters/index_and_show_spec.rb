require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see a list of all the shelter names" do
    feline_shelter = Shelter.create(name: "Rocky Mountain Feline Rescue",
                                    address: "2390 S Delaware St",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80223")
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")

    visit '/shelters'

    expect(page).to have_content(feline_shelter.name)
    expect(page).to have_content(dog_shelter.name)
  end
  it "I can navigate to the pets index page" do
    feline_shelter = Shelter.create(name: "Rocky Mountain Feline Rescue",
                                    address: "2390 S Delaware St",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80223")
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")

    visit '/shelters'

    click_link "Pets"

    expect(current_path).to eq('/pets')
  end
  it "I can see a specific shelters information" do
    feline_shelter = Shelter.create(name: "Rocky Mountain Feline Rescue",
                                    address: "2390 S Delaware St",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80223")
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")

    visit "/shelters/#{dog_shelter.id}"

    expect(page).to have_content(dog_shelter.name)
    expect(page).to have_content(dog_shelter.address)
    expect(page).to_not have_content(feline_shelter.name)
  end
  it "I can navigate to the shelters index page" do
    feline_shelter = Shelter.create(name: "Rocky Mountain Feline Rescue",
                                    address: "2390 S Delaware St",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80223")
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")

    visit "/shelters/#{dog_shelter.id}"

    click_link "Shelters"

    expect(current_path).to eq('/shelters')
  end
  it "I can navigate to the pets index page" do
    feline_shelter = Shelter.create(name: "Rocky Mountain Feline Rescue",
                                    address: "2390 S Delaware St",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80223")
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")

    visit "/shelters/#{dog_shelter.id}"

    click_link "Pets"

    expect(current_path).to eq('/pets')
  end
end