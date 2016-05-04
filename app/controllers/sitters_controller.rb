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
#

class SittersController < ApplicationController

  def index
    sitters = Sitter.all
    render json: sitters.as_json(include: [:animals, :user, {cares: {only: :name}}])
  end

  def contacts
    sitter = Sitter.find(params[:id])
    render json: json_for_contacts(sitter.contacts)
  end

  def show
    sitter = Sitter.find params[:id]
    render json: sitter.sitter_json
  end

  private

  def json_for_contacts(contacts)
    contacts.map do |c|
      { id: c.id, app_id: c.app_id, date_start: c.date_start, date_final: c.date_final,
        time_start: c.time_start, time_final: c.time_final, created_at: c.created_at,
        status_cd: c.status_cd, total_value: c.total_value, owner: c.pet_owner.owner_json,
        sitter: c.sitter.sitter_json, animals: c.animals.map { |a| {id: a.id, name: a.name} } }
    end
  end

end
