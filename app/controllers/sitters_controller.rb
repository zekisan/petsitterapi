class SittersController < ApplicationController
  def index
    sitters = Sitter.all
    render json: sitters.as_json(include: [{animals: { only: :name }}, {cares: { only: :name }}])
  end

  def search
    sitters = Sitter.search_near_sitters params[:animals]
    render json: sitters.as_json
  end
end