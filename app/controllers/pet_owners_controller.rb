class PetOwnersController < ApplicationController

  before_filter :get_petowner

  def search_sitters
    sitters = @pet_owner.search_near_sitters(params[:animals])
    render json: sitters.as_json
  end

  def request_contact
    @pet_owner.contacts.build(sitter_id: params[:sitter_id],
                              date_start: params[:date_start].to_date,
                              date_final: params[:date_final].to_date,
                              time_start: params[:time_start],
                              time_final: params[:time_final]
    )

    if @pet_owner.save
      render json: 'ok'
    else
      render json: @pet_owner.errors.messages
    end
  end

  private

  def get_petowner
    @pet_owner = PetOwner.find params[:id]
  end
end