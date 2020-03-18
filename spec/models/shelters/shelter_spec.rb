require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

 #  describe 'class methods' do
 #   it '.index' do
 #     shelter_1 = Shelter.create(name: "Adams County Animal Shelter",
 #                                address: "10705 Fulton St",
 #                                city: "Brighton",
 #                                state: "CO",
 #                                zip: "80601")
 #     shelter_2 = Shelter.create(name: "Humane Society of Boulder Valley",
 #                                address: "2323 55th St",
 #                                city: "Boulder",
 #                                state: "CO",
 #                                zip: "80301")
 #
 #     expect(index).to eq(2)
 #     # expect(carly_rae.songs.song_count).to eq(2)
 #     # expect(prince.songs.song_count).to eq(1)
 #   end
 # end
end
