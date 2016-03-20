class SittersController < ApplicationController
  
  def index
    sitters = Sitter.all
    render json: sitters.as_json(include: [{animals: { only: :name }}, {cares: { only: :name }}])
  end

  def contacts
    sitter = Sitter.find(params[:id])
    render json: sitter.contacts.as_json(include: [:sitter, :pet_owner, :animals])
  end

end