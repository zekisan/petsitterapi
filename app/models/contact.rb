class Contact < ActiveRecord::Base

  belongs_to :pet_owner
  belongs_to :sitter

  has_many :animal_contacts
  has_many :animals, through: :animal_contacts

  accepts_nested_attributes_for :animal_contacts

end