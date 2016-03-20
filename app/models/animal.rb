class Animal < ActiveRecord::Base

  has_many :animal_sitters
  has_many :sitters, through: :animal_sitters

  has_many :animal_contacts
  has_many :contacts, through: :animal_contacts

end
