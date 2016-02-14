class PetOwnersController < ApplicationController

  def search_sitters
    pet_owner = PetOwner.find params[:id]
    sitters = pet_owner.search_near_sitters(pet_owner, params[:animals])
    render json: sitters.as_json
  end
end