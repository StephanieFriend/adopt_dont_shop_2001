require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see all the pets with their information" do
    dog_shelter = Shelter.create(name: "My Dog Care",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    albus = Pet.create(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWNWWZEcKbX88U4kdRpqzKxTypifxR8JmDZdjcSdq2ngw0bAl8',
                       name: "Albus",
                       approximate_age: 1,
                       sex: "Male",
                       shelter: dog_shelter)
    samson = Pet.create(image: 'https://www.dogster.com/wp-content/uploads/2019/03/Close-up-of-a-Boxer-with-tongue-out-happy.jpg',
                       name: "Samson",
                       approximate_age: 4,
                       sex: "Male",
                       shelter: dog_shelter)

    visit '/pets'

    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWNWWZEcKbX88U4kdRpqzKxTypifxR8JmDZdjcSdq2ngw0bAl8']")
    expect(page).to have_content(albus.name)
    expect(page).to have_content(samson.sex)
    expect(page).to have_content(dog_shelter.name)
  end
  it "I can navigate to shelters index page" do
    dog_shelter = Shelter.create(name: "My Dog Care",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    albus = Pet.create(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWNWWZEcKbX88U4kdRpqzKxTypifxR8JmDZdjcSdq2ngw0bAl8',
                       name: "Albus",
                       approximate_age: 1,
                       sex: "Male",
                       shelter: dog_shelter)
    samson = Pet.create(image: 'https://www.dogster.com/wp-content/uploads/2019/03/Close-up-of-a-Boxer-with-tongue-out-happy.jpg',
                        name: "Samson",
                        approximate_age: 4,
                        sex: "Male",
                        shelter: dog_shelter)

    visit '/pets'

    click_link 'Shelters'

    expect(current_path).to eq('/shelters')
  end
  it "I can see a pets specific information" do
    dog_shelter = Shelter.create(name: "My Dog Care",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
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

    visit "/pets/#{albus.id}"

    expect(page).to have_content(albus.name)
    expect(page).to have_content(albus.description)
    expect(page).to_not have_content(samson.name)
  end
  it "I can navigate to pets index page" do
    dog_shelter = Shelter.create(name: "My Dog Care",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
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

    visit "/pets/#{albus.id}"

    click_link 'Pets'

    expect(current_path).to eq('/pets')
  end
  it "I can navigate to shelters index page" do
    dog_shelter = Shelter.create(name: "My Dog Care",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
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

    visit "/pets/#{albus.id}"

    click_link 'Shelters'

    expect(current_path).to eq('/shelters')
  end
end
