class SittersController < ApplicationController
  
  def index
    sitters = Sitter.all
    render json: sitters.as_json(include: [{animals: { only: :name }}, {cares: { only: :name }}])
  end

  def contacts
    owner = PetOwner.find(params[:id])
    render json: owner.contacts.as_json(include: [:sitter, :pet_owner])
  end

end