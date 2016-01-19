class SittersController < ApplicationController
  def index
    @sitters = Sitter.all
    render json: @sitters.as_json(include: [{animals: { only: :name }}, {cares: { only: :name }}])
  end
end