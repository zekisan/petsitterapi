# == Schema Information
#
# Table name: sitters
#
#  id             :integer          not null, primary key
#  name           :string
#  district       :string
#  about_me       :text
#  value_hour     :decimal(5, 2)
#  latitude       :decimal(18, 16)
#  longitude      :decimal(18, 16)
#  photo_id       :integer
#  phone          :string
#  rate_avg       :integer
#  app_id         :string
#  surname        :string
#  street         :string
#  address_number :string
#  complement     :string
#  cep            :string
#  city           :string
#  state          :string
#

class Sitter < ActiveRecord::Base

  has_many :animal_sitters
  has_many :animals, through: :animal_sitters

  has_many :care_sitters
  has_many :cares, through: :care_sitters

  has_many :contacts

  has_many :profile_photos, class_name: 'SitterProfilePhoto'

  belongs_to :photo

  accepts_nested_attributes_for :animal_sitters

  before_create :set_rate_avg

  def sitter_json
    {app_id: self.app_id, name: self.name, surname: self.surname, district: self.district,
     about_me: self.about_me, street: self.street, address_number: self.address_number, cep: self.cep,
     complement: self.complement, city: self.city, state: self.state,
     value_hour: self.value_hour.to_d, latitude: self.latitude.to_d, longitude: self.longitude.to_d,
     phone: self.phone, rate_avg: self.rate_avg, contacts: self.contacts.map { |c| c.contact_json },
     animals: self.animals.map { |a| {id: a.id, name: a.name} },
     photo: {app_id: self.photo.app_id, image: self.photo.image.url },
     profile_photos: self.profile_photos.map { |p| {app_id: p.app_id, image: p.image.url } }}
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
