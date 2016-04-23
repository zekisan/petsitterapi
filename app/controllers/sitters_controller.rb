# == Schema Information
#
# Table name: sitters
#
#  id                :integer          not null, primary key
#  name              :string
#  address           :string
#  latitude          :decimal(18, 16)
#  longitude         :decimal(18, 16)
#  photo             :string
#  header_background :string
#  district          :string
#  value_hour        :decimal(5, 2)
#  value_shift       :decimal(5, 2)
#  value_day         :decimal(5, 2)
#  about_me          :text
#  user_id           :integer
#

class SittersController < ApplicationController

  def index
    sitters = Sitter.all
    render json: sitters.as_json(include: [:animals, :user, {cares: {only: :name}}])
  end

  def contacts
    sitter = Sitter.find(params[:id])
    render json: sitter.contacts.as_json(include: [:sitter, :pet_owner, :animals, :rates])
  end

end
