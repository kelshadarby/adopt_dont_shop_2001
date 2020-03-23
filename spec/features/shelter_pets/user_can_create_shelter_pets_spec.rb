require 'rails_helper'

RSpec.describe "as a user", type: :feature do
  it "can create a new pet associated with a shelter by filling out form" do

    shelter_1 = Shelter.create(name: "Adams County Animal Shelter",
                               address: "10705 Fulton St",
                               city: "Brighton",
                               state: "CO",
                               zip: "80601")

    visit "/shelter/#{shelter_1.id}/pets"
    click_link('Create Pet')

    expect(current_path).to eq("/shelter/#{shelter_1.id}/pets/new")

    expect(page).to have_field('Image URL')
    expect(page).to have_field('Name')
    expect(page).to have_field('Description (About Me)')
    expect(page).to have_field('Approximate Age')
    expect(page).to have_selector('Sex')

    fill_in 'Image URL', with: 'https://i.pinimg.com/originals/30/f7/eb/30f7eb5efeda4be553a9daa8cb2e90d8.jpg'
    fill_in 'Name', with: 'Rex'
    fill_in 'Description (About Me)', with: 'Hi, I’m Rex. I’m a Basset Hound, I think walks are rather overrated. I prefer to sleep by the fire but I can bribed to get up if there is food. Come hang out by the fire with me.'
    fill_in 'Approximate Age', with: '8 y/o'
    select 'Male', from: 'Sex'
    click_button('Create Pet')

    expect(current_path).to eq("/shelter/#{shelter_1.id}/pets")

    expect(page).to have_css("img[src*='https://i.pinimg.com/originals/30/f7/eb/30f7eb5efeda4be553a9daa8cb2e90d8.jpg']")
    expect(page).to have_content('Rex')
    expect(page).to have_content("Approximate Age: 8 y/o")
    expect(page).to have_content("Sex: Male")
    expect(page).to_not have_content("Adoptable")
    expect(page).to_not have_content('Hi, I’m Rex. I’m a Basset Hound, I think walks are rather overrated. I prefer to sleep by the fire but I can bribed to get up if there is food. Come hang out by the fire with me.')
  end
end

# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
