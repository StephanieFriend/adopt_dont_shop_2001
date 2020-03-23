require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can update a pet when I visit their show page" do
    dog_shelter = Shelter.create(name: "Doggie Day",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    samson = Pet.create(image: 'https://www.dogster.com/wp-content/uploads/2019/03/Close-up-of-a-Boxer-with-tongue-out-happy.jpg',
                        name: "Samson",
                        approximate_age: 3,
                        sex: "Male",
                        shelter: dog_shelter)

    visit '/pets'

    click_link 'Samson'
    click_link 'Edit'

    expect(current_path).to eq("/pets/#{samson.id}/edit")

    fill_in :approximate_age, with: 4
    click_on 'Update Pet'

    expect(current_path).to eq("/pets/#{samson.id}")
    expect(page).to have_content(4)
    expect(page).to have_content(samson.name)
  end
  it "I can edit a pet when I visit their index page" do
    dog_shelter = Shelter.create(name: "Doggie Day",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    samson = Pet.create(image: 'https://www.dogster.com/wp-content/uploads/2019/03/Close-up-of-a-Boxer-with-tongue-out-happy.jpg',
                        name: "Samson",
                        approximate_age: 3,
                        sex: "Male",
                        shelter: dog_shelter)

    visit '/pets'

    click_link 'Edit'

    expect(current_path).to eq("/pets/#{samson.id}/edit")

    fill_in :approximate_age, with: 4
    click_on 'Update Pet'

    expect(current_path).to eq("/pets/#{samson.id}")
    expect(page).to have_content(4)
    expect(page).to have_content(samson.name)
  end
  it "I can navigate to the shelters index page" do
    dog_shelter = Shelter.create(name: "Doggie Day",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    samson = Pet.create(image: 'https://www.dogster.com/wp-content/uploads/2019/03/Close-up-of-a-Boxer-with-tongue-out-happy.jpg',
                        name: "Samson",
                        approximate_age: 3,
                        sex: "Male",
                        shelter: dog_shelter)

    visit '/pets'

    click_link 'Samson'
    click_link 'Edit'
    click_link 'Shelters'

    expect(current_path).to eq('/shelters')
  end
  it "I can navigate to the pets index page" do
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    samson = Pet.create(image: 'https://www.dogster.com/wp-content/uploads/2019/03/Close-up-of-a-Boxer-with-tongue-out-happy.jpg',
                        name: "Samson",
                        approximate_age: 3,
                        sex: "Male",
                        shelter: dog_shelter)

    visit '/pets'

    click_link 'Samson'
    click_link 'Edit'
    click_link 'Pets'

    expect(current_path).to eq('/pets')
  end
end