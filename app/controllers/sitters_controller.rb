# == Schema Information
#
# Table name: sitters
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  district   :string
#  about_me   :text
#  value_hour :decimal(5, 2)
#  latitude   :decimal(18, 16)
#  longitude  :decimal(18, 16)
#  photo_id   :integer
#  phone      :string
#  rate_avg   :integer
#  app_id     :string
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

  def show
    sitter = Sitter.find params[:id]
    render json: sitter.sitter_json
  end

  def insert_profile_photo
    sitter = Sitter.find_by_app_id(params[:app_id])
    sitter.profile_photos.build(image: params[:image])
    sitter.save
    render json: 'ok'
  end

  private

  def json_for_contacts(contacts)
    contacts.map { |c| c.contact_json }
  end

end
