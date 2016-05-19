# == Schema Information
#
# Table name: pets
#
#  id           :integer          not null, primary key
#  name         :string
#  age          :integer
#  size         :string
#  weight       :decimal(6, 3)
#  breed        :string
#  pet_owner_id :integer
#  animal_id    :integer
#  app_id       :string
#

class Pet < ActiveRecord::Base
  extend Enumerize

  belongs_to :pet_owner
  belongs_to :animal

  has_many :pet_cares

  enumerize :size, in: [:pequeno, :medio, :grande]

  accepts_nested_attributes_for :pet_cares

  def pet_json
    { app_id: self.app_id, name: self.name, age: self.age, size: self.size_text, weight: self.weight, breed: self.breed,
    pet_cares: self.pet_cares.map(&:pet_care_json)}
  end
end
