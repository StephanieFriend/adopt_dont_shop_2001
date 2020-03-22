require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can visit the shelter page and create a new pet" do
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    albus = Pet.create(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWNWWZEcKbX88U4kdRpqzKxTypifxR8JmDZdjcSdq2ngw0bAl8',
                       name: "Albus",
                       approximate_age: 1,
                       sex: "Male",
                       shelter: dog_shelter)

    visit '/shelters'

    click_link 'MaxFund Dog Shelter'
    click_link 'Create Pet'

    expect(current_path).to eq("/shelters/#{dog_shelter.id}/pets/new")

    fill_in :image, with: albus.image
    fill_in :name, with: albus.name
    fill_in :description, with: albus.description
    fill_in :approximate_age, with: albus.approximate_age
    fill_in :sex, with: albus.sex

    click_button 'Create Pet'

    expect(current_path).to eq("/shelters/#{dog_shelter.id}/pets")
    expect(page).to have_content(albus.name)
  end
  it "I can navigate back to pets index page" do
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    albus = Pet.create(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWNWWZEcKbX88U4kdRpqzKxTypifxR8JmDZdjcSdq2ngw0bAl8',
                       name: "Albus",
                       approximate_age: 1,
                       sex: "Male",
                       shelter: dog_shelter)

    visit '/shelters'

    click_link 'MaxFund Dog Shelter'
    click_link 'Create Pet'
    click_link 'Pets'

    expect(current_path).to eq('/pets')
  end
  it "I can navigate back to shelters index page" do
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    albus = Pet.create(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWNWWZEcKbX88U4kdRpqzKxTypifxR8JmDZdjcSdq2ngw0bAl8',
                       name: "Albus",
                       approximate_age: 1,
                       sex: "Male",
                       shelter: dog_shelter)

    visit '/shelters'

    click_link 'MaxFund Dog Shelter'
    click_link 'Create Pet'
    click_link 'Shelters'

    expect(current_path).to eq('/shelters')
  end
end