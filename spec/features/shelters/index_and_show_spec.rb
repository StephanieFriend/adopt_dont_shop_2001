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
    expect(page).to_not have_content(feline_shelter.address)
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

    click_link 'Pets'

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

    visit '/shelters'
    click_link 'MaxFund Dog Shelter'

    expect(page).to have_content(dog_shelter.name)
    expect(page).to have_content(dog_shelter.address)
    expect(page).to_not have_content(feline_shelter.name)
  end
  it "I can be taken to the shelters specific pets" do
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
    simba = feline_shelter.pets.create(image: 'https://www.worldsbestcatlitter.com/clearing-the-air/wp-content/uploads/2018/02/cat-toothbrushing-blog_main-img-1-858x429.jpg',
                                       name: "Simba",
                                       approximate_age: 8,
                                       sex: "Male")
    albus = Pet.create(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWNWWZEcKbX88U4kdRpqzKxTypifxR8JmDZdjcSdq2ngw0bAl8',
                       name: "Albus",
                       description: "I am a very slobbery St Bernard",
                       approximate_age: 1,
                       sex: "Male",
                       shelter: dog_shelter)
    samson = Pet.create(image: 'https://www.dogster.com/wp-content/uploads/2019/03/Close-up-of-a-Boxer-with-tongue-out-happy.jpg',
                        name: "Samson",
                        description: "I am a wild and crazy boxer",
                        approximate_age: 4,
                        sex: "Male",
                        shelter: dog_shelter)

    visit '/shelters'

    click_link 'MaxFund Dog Shelter'
    click_link "Shelter's Pets"

    expect(current_path).to eq("/shelters/#{dog_shelter.id}/pets")
    expect(page).to have_content(albus.name)
    expect(page).to have_content(albus.approximate_age)
    expect(page).to have_content(samson.name)
    expect(page).to have_content(samson.sex)
    expect(page).to_not have_content(simba.name)
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

    visit '/shelters'

    click_link 'MaxFund Dog Shelter'
    click_link 'Shelters'

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

    visit '/shelters'

    click_link 'MaxFund Dog Shelter'
    click_link 'Pets'

    expect(current_path).to eq('/pets')
  end
end