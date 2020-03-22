require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can create a shelter" do
    beagle_rescue = Shelter.create(name: "Colorado Beagle Rescue",
                                    address: "10940 S Parker Rd #161",
                                    city: "Parker",
                                    state: "CO",
                                    zip: "80134")

    visit '/shelters'

    click_link 'New Shelter'

    expect(current_path).to eq('/shelters/new')

    fill_in :name, with: beagle_rescue.name
    fill_in :address, with: beagle_rescue.address
    fill_in :city, with: beagle_rescue.city
    fill_in :state, with: beagle_rescue.state
    fill_in :zip, with: beagle_rescue.zip

    click_button 'Create Shelter'

    expect(current_path).to eq('/shelters')
    expect(page).to have_content(beagle_rescue.name)
  end
  it "I can navigate to the shelters index page" do
    beagle_rescue = Shelter.create(name: "Colorado Beagle Rescue",
                                   address: "10940 S Parker Rd #161",
                                   city: "Parker",
                                   state: "CO",
                                   zip: "80134")

    visit '/shelters'

    click_link 'New Shelter'
    click_link 'Shelters'

    expect(current_path).to eq('/shelters')
  end
  it "I can navigate to the pets index page" do
    beagle_rescue = Shelter.create(name: "Colorado Beagle Rescue",
                                   address: "10940 S Parker Rd #161",
                                   city: "Parker",
                                   state: "CO",
                                   zip: "80134")

    visit '/shelters'

    click_link 'New Shelter'
    click_link 'Pets'

    expect(current_path).to eq('/pets')
  end
end