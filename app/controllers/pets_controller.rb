class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:pet_id])
  end

  def edit
    @pet = Pet.find(params[:pet_id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)

    pet.save
    redirect_to "/pets/#{pet.id}"
  end

private

  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :adoption_status)
  end
end
