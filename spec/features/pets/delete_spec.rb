require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can delete a pet" do
    humane_society = Shelter.create(name: "Humane Society Of The South Platte Valley",
                                    address: "2129 W Chenango Ave",
                                    city: "Littleton",
                                    state: "CO",
                                    zip: "80120")
    mr_hopper = Pet.create(image: "MrHopper.jpeg",
                           name: "Mr. Hopper",
                           description: "Loves to cuddle! Self grooming and eats veggies. Perfect for families.",
                           approximate_age: 5,
                           sex: "Male",
                           shelter: humane_society)

    visit "/pets/#{mr_hopper.id}"

    expect(page).to have_content(mr_hopper.name)

    click_link 'Delete Pet'

    expect(current_path).to eq('/pets')
    visit "/pets"
    expect(page).to_not have_content(mr_hopper.name)
  end

end