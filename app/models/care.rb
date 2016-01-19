class Care < ActiveRecord::Base

  has_many :care_sitters
  has_many :sitters, through: :care_sitters

end
