require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "can show shelters with edited details" do
    shelter_1 = Shelter.create(name: "Adams County Animal Shelter",
                               address: "10705 Fulton St",
                               city: "Brighton",
                               state: "CO",
                               zip: "80601")
    shelter_2 = Shelter.create(name: "Humane Society of Boulder Valley",
                               address: "2323 55th St",
                               city: "Boulder",
                               state: "CO",
                               zip: "80301")

    visit "/shelters/#{shelter_1[:id]}/edit"

    page.fill_in 'Name', with: 'Adams County Animal Services'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
