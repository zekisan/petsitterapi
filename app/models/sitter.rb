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
    { id: self.id, name: self.name, address: self.address, district: self.district, about_me: self.about_me,
    value_hour: self.value_hour.to_d, latitude: self.latitude.to_d, longitude: self.longitude.to_d,
      phone: self.phone }
  end
end
