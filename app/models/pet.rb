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

  def pet_json
    { app_id: self.app_id, name: self.name, age: self.age, size: self.size_text, weight: self.weight, breed: self.breed,
    pet_care: self.pet_care}
  end
end
