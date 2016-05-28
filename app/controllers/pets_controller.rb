class PetsController < ApplicationController

  def create_pet
    pet_owner = PetOwner.find_by_app_id params[:owner_app_id]
    animal = Animal.find params[:animal_id]
    Pet.create(
        app_id: params[:app_id],
        name: params[:name],
        age: params[:age],
        age_text: params[:age_text],
        size: params[:size],
        weight: params[:weight],
        breed: params[:breed],
        pet_care: params[:pet_care],
        pet_owner: pet_owner,
        animal: animal
    )
    render json: 'ok'
  end

  def insert_photo
    photo = Photo.create(app_id: params[:photo_app_id], image: params[:image])
    Pet.find_by_app_id(params[:app_id]).update(photo: photo)
    render json: 'ok'
  end
end