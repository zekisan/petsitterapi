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
#  age_text     :string
#  pet_care     :string
#

class Pet < ActiveRecord::Base
  extend Enumerize

  belongs_to :pet_owner
  belongs_to :animal

  belongs_to :photo

  def pet_json
    { app_id: self.app_id, name: self.name, age: self.age, age_text: self.age_text, size: self.size, weight: self.weight,
      breed: self.breed, pet_care: self.pet_care, animal: self.animal.animal_json,
      photo: { app_id: self.photo.app_id, thumb: self.photo.image.thumb.url, medium: self.photo.image.medium.url,
                                                                                            large: self.photo.image.large.url }}
  end
end
