# == Schema Information
#
# Table name: pet_owners
#
#  id             :integer          not null, primary key
#  name           :string
#  district       :string
#  latitude       :decimal(18, 16)
#  longitude      :decimal(18, 16)
#  photo_id       :integer
#  app_id         :string
#  surname        :string
#  street         :string
#  address_number :string
#  complement     :string
#  cep            :string
#  city           :string
#  state          :string
#

class PetOwnersController < ApplicationController

  before_filter :get_petowner

  def search_sitters
    sitters = @pet_owner.search_near_sitters(params[:animals])
    render json: json_for_search_results(sitters)
  end

  def request_contact
    pets = Pet.where(app_id: params[:pet_contacts].map { |p| p["pet_app_id"] })
    @pet_owner.contacts.build(sitter_id: Sitter.find_by_app_id(pet_owners_params[:sitter_id].id),
                              app_id: pet_owners_params[:contact_app_id],
                              date_start: pet_owners_params[:date_start],
                              date_final: pet_owners_params[:date_final],
                              time_start: pet_owners_params[:time_start],
                              time_final: pet_owners_params[:time_final],
                              total_value: pet_owners_params[:total_value].to_s,
                              pets: pets
    )

    if @pet_owner.save
      render json: 'ok'
    else
      render json: @pet_owner.errors.messages
    end
  end

  def insert_profile_photo
    pet_owner = PetOwner.find_by_app_id(params[:app_id])
    pet_owner.profile_photos.build(image: params[:image])
    pet_owner.save
    render json: 'ok'
  end

  def contacts
    pet_owner = PetOwner.find_by_app_id(params[:app_id])
    render json: json_for_contacts(pet_owner.contacts)
  end

  def rate_contact
    pet_owner = PetOwner.find_by_app_id(params[:owner_app_id])
    contact = pet_owner.contacts.where(app_id: params[:contact_app_id]).first
    Rate.create(
        contact: contact,
        stars_qtd: params[:stars_qtd],
        app_id: params[:rate_app_id],
        pet_owner_comment: params[:owner_comment]
    )
    contact.sitter.update_rate_avg
    render json: 'ok'
  end

  def insert_photo
    photo = Photo.create(app_id: params[:photo_app_id], image: params[:image])
    PetOwner.find_by_app_id(params[:app_id]).update(photo: photo)
    render json: 'ok'
  end

  def get_owner
    owner = PetOwner.find_by_app_id params[:app_id]
    render json: owner.owner_json
  end

  def create_pet_owner
    PetOwner.create(
        app_id: params[:owner_app_id],
        name: params[:name],
        surname: params[:surname],
        phone: params[:phone],
        street: params[:street],
        address_number: params[:address_number],
        complement: params[:complement],
        cep: params[:cep],
        district: params[:district],
        city: params[:city],
        state: params[:state],
        latitude: params[:latitude],
        longitude: params[:longitude],
    )
    User.create(
        app_id: params[:user_app_id], email: params[:email], password: params[:password],
        entity_type: params[:entity_type], entity_id: params[:entity_id], device_token: params[:device_token]
    )
    render json: 'ok'
  end

  private

  def get_petowner
    @pet_owner = PetOwner.find_by_app_id(params[:app_id])
  end

  def pet_owners_params
    params.permit!
  end

  def json_for_search_results(sitters)
    sitters.map(&:sitter_json)
  end

  def json_for_contacts(contacts)
    contacts.map { |c| c.contact_json }
  end
end
