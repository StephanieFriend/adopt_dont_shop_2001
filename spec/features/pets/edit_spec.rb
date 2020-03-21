require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can update a pet when I visit their show page" do
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    samson = Pet.create(image: 'boxerpic.jpg',
                        name: "Samson",
                        approximate_age: 3,
                        sex: "Male",
                        shelter: dog_shelter)
    visit "/pets/#{samson.id}"
    click_link 'Edit'

    expect(current_path).to eq("/pets/#{samson.id}/edit")

    fill_in :approximate_age, with: 4
    click_on 'Update Pet'

    expect(current_path).to eq("/pets/#{samson.id}")
    expect(page).to have_content(4)
    expect(page).to have_content(samson.name)
  end
end