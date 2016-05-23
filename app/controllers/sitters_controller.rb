# == Schema Information
#
# Table name: sitters
#
#  id             :integer          not null, primary key
#  name           :string
#  district       :string
#  about_me       :text
#  value_hour     :decimal(5, 2)
#  latitude       :decimal(18, 16)
#  longitude      :decimal(18, 16)
#  photo_id       :integer
#  phone          :string
#  rate_avg       :integer
#  app_id         :string
#  surname        :string
#  street         :string
#  address_number :string
#  complement     :string
#  cep            :string
#  city           :string
#  state          :string
#

class SittersController < ApplicationController

  def index
    sitters = Sitter.all
    render json: sitters.as_json(include: [:animals, :user, {cares: {only: :name}}])
  end

  def contacts
    sitter = Sitter.find_by_app_id(params[:app_id])
    render json: json_for_contacts(sitter.contacts)
  end

  def get_sitter
    sitter = Sitter.find_by_app_id params[:app_id]
    render json: sitter.sitter_json
  end

  def insert_profile_photo
    sitter = Sitter.find_by_app_id(params[:app_id])
    sitter.profile_photos.build(image: params[:image])
    sitter.save
    render json: 'ok'
  end

  def create_sitter
    photo = Photo.create(app_id: params[:photo_app_id], image: params[:image])
    Sitter.create(
        app_id: params[:sitter_app_id],
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
        photo: photo,
        about_me: params[:about_me],
        value_hour: params[:value_hour],
        rate_avg: 0
    )
    User.create(
        app_id: params[:user_app_id], email: params[:email], password: params[:password],
        entity_type: params[:entity_type], entity_id: params[:entity_id]
    )
    render json: 'ok'
  end

  private

  def json_for_contacts(contacts)
    contacts.map { |c| c.contact_json }
  end

end
