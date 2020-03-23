require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see the count of pets per shelter" do
  dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
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

  visit "shelters/#{dog_shelter.id}"

  click_link "Shelter's Pets"

  expect(page).to have_content(2)
  expect(page).to have_content(albus.name)
  expect(page).to have_content(samson.sex)
  end
end