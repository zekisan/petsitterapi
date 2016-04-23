# == Schema Information
#
# Table name: pet_owners
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :decimal(18, 16)
#  longitude  :decimal(18, 16)
#  district   :string
#  photo      :string
#  user_id    :integer
#

class PetOwnersController < ApplicationController

  before_filter :get_petowner

  def search_sitters
    sitters = @pet_owner.search_near_sitters(params[:animals])
    render json: sitters.as_json(include: [:animals, :user])
  end

  def request_contact
    @pet_owner.contacts.build(sitter_id: pet_owners_params[:sitter_id],
                              app_id: pet_owners_params[:app_id],
                              date_start: pet_owners_params[:date_start],
                              date_final: pet_owners_params[:date_final],
                              time_start: pet_owners_params[:time_start],
                              time_final: pet_owners_params[:time_final],
                              total_value: pet_owners_params[:total_value].to_s,
                              animal_contacts_attributes: pet_owners_params[:animal_contacts]
    )

    if @pet_owner.save
      render json: 'ok'
    else
      render json: @pet_owner.errors.messages
    end
  end

  def contacts
    pet_owner = PetOwner.find(params[:id])
    render json: pet_owner.contacts.as_json(include: [:sitter, :pet_owner, :animals, :rate])
  end

  def rate_contact
    pet_owner = PetOwner.find(params[:id])
    contact = pet_owner.contacts.where(id: params[:contact_id]).first
    Rate.create(
        contact: contact,
        positive: params[:positive],
        sitter_comment_attributes: {text: params[:text]}
    )
    render json: 'ok'
  end

  private

  def get_petowner
    @pet_owner = PetOwner.find params[:id]
  end

  def pet_owners_params
    params.permit!
  end
end
