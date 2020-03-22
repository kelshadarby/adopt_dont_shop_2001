class ShelterPetsController < ApplicationController
  def index
    @shelter_pets = Shelter.find(params[:shelter_id])
  end
end
