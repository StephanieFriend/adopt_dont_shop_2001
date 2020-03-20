require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can delete a shelter" do
    humane_society = Shelter.create(name: "Humane Society Of The South Platte Valley",
                                    address: "2129 W Chenango Ave",
                                    city: "Littleton",
                                    state: "CO",
                                    zip: "80120")
    visit "/shelters/#{humane_society.id}"

    expect(page).to have_content(humane_society.name)

    click_link 'Delete Shelter'

    expect(current_path).to eq('/shelters')
    visit "/shelters"
    expect(page).to_not have_content(humane_society.name)
  end
end
