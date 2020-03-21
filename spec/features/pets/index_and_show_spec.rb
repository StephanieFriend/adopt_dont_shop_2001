require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see all the pets with their information" do
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    albus = Pet.create(image: 'download_20200106_121856.jpg',
                       name: "Albus",
                       approximate_age: 1,
                       sex: "Male",
                       shelter: dog_shelter)
    samson = Pet.create(image: 'boxerpic.jpg',
                       name: "Samson",
                       approximate_age: 4,
                       sex: "Male",
                       shelter: dog_shelter)
    visit '/pets'

    # expect(page).to have_css("img[src*='#{albus.image}']")
    expect(page).to have_content(albus.name)
    expect(page).to have_content(samson.sex)
    expect(page).to have_content(dog_shelter.name)
  end
  it "I can see a pets specific information" do
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    albus = Pet.create(image: 'download_20200106_121856.jpg',
                       name: "Albus",
                       description: "I am a very slobbery St Bernard",
                       approximate_age: 1,
                       sex: "Male",
                       shelter: dog_shelter)
    samson = Pet.create(image: 'boxerpic.jpg',
                        name: "Samson",
                        description: "I am a wild and crazy boxer",
                        approximate_age: 4,
                        sex: "Male",
                        shelter: dog_shelter)
    visit "/pets/#{albus.id}"

    expect(page).to have_content(albus.name)
    expect(page).to have_content(albus.description)
    expect(page).to_not have_content(samson.name)
  end
end
