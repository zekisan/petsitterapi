# == Schema Information
#
# Table name: pet_owners
#
#  id        :integer          not null, primary key
#  name      :string
#  address   :string
#  district  :string
#  latitude  :decimal(18, 16)
#  longitude :decimal(18, 16)
#  photo_id  :integer
#

class PetOwner < ActiveRecord::Base
  include Concerns::DistanceCalculation

  has_many :contacts

  belongs_to :photo

  def owner_json
    { id: self.id, name: self.name, address: self.address, district: self.district,
      latitude: self.latitude.to_d, longitude: self.longitude.to_d,
      photo: { thumb: self.photo.image.thumb.url, medium: self.photo.image.medium.url,
               large: self.photo.image.large.url } }
  end
end
