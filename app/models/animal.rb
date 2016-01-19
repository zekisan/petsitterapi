class Animal < ActiveRecord::Base

  has_many :animal_sitters
  has_many :sitters, through: :animal_sitters

end
