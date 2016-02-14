class SittersController < ApplicationController
  def index
    @sitters = Sitter.all
    render json: @sitters.as_json(include: [{animals: { only: :name }}, {cares: { only: :name }}])
  end

  def search
    render json: params.as_json
  end
end