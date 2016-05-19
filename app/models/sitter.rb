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
#

class Sitter < ActiveRecord::Base

  has_many :animal_sitters
  has_many :animals, through: :animal_sitters

  has_many :care_sitters
  has_many :cares, through: :care_sitters

  has_many :contacts

  has_many :profile_photos, class_name: 'SitterProfilePhoto'

  belongs_to :photo

  before_create :set_rate_avg

  def sitter_json
    {id: self.id, name: self.name, address: self.address, district: self.district, about_me: self.about_me,
     value_hour: self.value_hour.to_d, latitude: self.latitude.to_d, longitude: self.longitude.to_d,
     phone: self.phone, rate_avg: self.rate_avg, animals: self.animals.map { |a| {id: a.id, name: a.name} },
     photo: {thumb: self.photo.image.thumb.url, medium: self.photo.image.medium.url,
             large: self.photo.image.large.url},
     profile_photos: self.profile_photos.map { |p| { thumb: p.image.thumb.url,
     medium: p.image.medium.url, large: p.image.large.url}}}
  end

  def update_rate_avg
    rates = self.contacts.map(&:rate).compact
    self.rate_avg = if rates.size > 0
                      (rates.map(&:stars_qtd).sum / rates.size).to_i
                    else
                      0
                    end
    self.save!
  end

  private

  def set_rate_avg
    self.rate_avg = 0
  end
end
