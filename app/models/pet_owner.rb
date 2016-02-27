class PetOwner < ActiveRecord::Base
  include Concerns::DistanceCalculation

  has_many :contacts
end
