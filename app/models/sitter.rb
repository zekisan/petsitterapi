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

class Sitter < ActiveRecord::Base

  has_many :animal_sitters
  has_many :animals, through: :animal_sitters

  has_many :care_sitters
  has_many :cares, through: :care_sitters

  has_many :contacts

  belongs_to :photo

  def sitter_json
    {id: s.id, name: s.name, address: s.address, district: s.district, about_me: s.about_me,
     value_hour: s.value_hour.to_d, latitude: s.latitude.to_d, longitude: s.longitude.to_d,
     phone: s.phone, animals: s.animals.map { |a| {id: a.id, name: a.name} },
     photo: {thumb: s.photo.image.thumb.url, medium: s.photo.image.medium.url,
             large: s.photo.image.large.url}}
  end
end
