require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can show shelters with added shelter" do
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

    visit "/shelters/new"

    expect(page).to have_field('Name')
    expect(page).to have_field('Address')
    expect(page).to have_field('City')
    expect(page).to have_field('State')
    expect(page).to have_field('Zip')

    page.fill_in 'Name', with: 'Stray Hearts Taos Animal Shelter'
    page.fill_in 'Address', with: '1200 Saint Frances Ln'
    page.fill_in 'City', with: 'Taos'
    page.fill_in 'State', with: 'NM'
    page.fill_in 'Zip', with: '87571'
    click_button 'Create Shelter'

    visit "/shelters"

    expect(page).to have_content('Stray Hearts Taos Animal Shelter')
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
