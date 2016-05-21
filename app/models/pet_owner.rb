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
#  app_id    :string
#  surname   :string
#

class PetOwner < ActiveRecord::Base
  include Concerns::DistanceCalculation

  has_many :contacts
  has_many :profile_photos, class_name: 'PetOwnerProfilePhoto'
  has_many :pets

  belongs_to :photo

  def owner_json
    { app_id: self.app_id, name: self.name, surname: self.surname, address: self.address, district: self.district,
      latitude: self.latitude.to_d, longitude: self.longitude.to_d,
      photo: { app_id: self.photo.app_id, thumb: self.photo.image.thumb.url, medium: self.photo.image.medium.url,
               large: self.photo.image.large.url },
      pets: self.pets.map(&:pet_json),
      profile_photos: self.profile_photos.map { |p| { app_id: p.app_id, thumb: p.image.thumb.url,
                                                      medium: p.image.medium.url, large: p.image.large.url}}}
  end
end
