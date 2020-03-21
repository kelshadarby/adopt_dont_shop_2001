require 'rails_helper'

RSpec.describe "as a user", type: :feature do
  it "can see all pets in system, including image, name, approximate age, sex, and shelter" do

    shelter_1 = Shelter.create(name: "Adams County Animal Shelter",
      address: "10705 Fulton St",
      city: "Brighton",
      state: "CO",
      zip: "80601")

    pet_1 = Pet.create(image: "https://i.pinimg.com/originals/a6/0f/7f/a60f7f075fcbe60956a31179c5eff08c.jpg",
                       name: "Spyro",
                       approximate_age: 2,
                       sex: "Male",
                       current_shelter: shelter_1.name)

    visit "/pets"

    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.current_shelter)
    expect(pet_1.current_shelter).to eq(shelter_1.name)
  end
end
