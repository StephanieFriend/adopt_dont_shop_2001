require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it {should validate_presence_of :image}
    it {should validate_presence_of :name}
    it {should validate_presence_of :approximate_age}
    it {should validate_presence_of :sex}
    it {should validate_presence_of :shelter}
  end
  describe 'relationships' do
    it {should belong_to :shelter}
  end
  describe 'class methods' do
    it '.pet_count' do
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
                         approximate_age: 1,
                         sex: "Male",
                         shelter_id: dog_shelter.id)
      samson = Pet.create(image: 'https://www.dogster.com/wp-content/uploads/2019/03/Close-up-of-a-Boxer-with-tongue-out-happy.jpg',
                          name: "Samson",
                          approximate_age: 4,
                          sex: "Male",
                          shelter_id: dog_shelter.id)

      expect(Pet.pet_count).to eq(3)
      expect(feline_shelter.pets.pet_count).to eq(1)
      expect(dog_shelter.pets.pet_count).to eq(2)
    end
  end
end