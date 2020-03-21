require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see all the pets with their information" do
    dog_shelter = Shelter.create(name: "MaxFund Dog Shelter",
                                 address: "1005 Galapago St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80204")
    albus = Pet.create(image: 'download_20200106_121856.jpg',
                       name: "Albus",
                       approximate_age: 1,
                       sex: "male",
                       shelter_id: 5)
    visit '/pets'

    # expect(page).to have_css("img[src*='download_20200106_121856.jpg']")
    expect(page).to have_content(albus.name)
    expect(page).to have_content(dog_shelter.name)
  end
end

# <a href="/"><img alt="Logo-big" src="/assets/logo-small.png" />
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
