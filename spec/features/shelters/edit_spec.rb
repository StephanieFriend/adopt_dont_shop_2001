require 'rails_helper'

RSpec.describe 'As a visitor' do
    describe 'When I visit the shelter show page' do
      it 'I can update a shelter' do
        feline_shelter = Shelter.create(name: "Feline Rescue",
                                  address: "2390 S Delaware St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80223")

        visit "/shelters/#{feline_shelter.id}"

        click_link 'Edit'

        expect(current_path).to eq("/shelters/#{feline_shelter.id}/edit")

        fill_in 'Name', with: 'Rocky Mountain Feline Rescue'
        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{feline_shelter.id}")
        expect(page).to have_content('Rocky Mountain Feline Rescue')
      end
    end
end