class PetOwner < ActiveRecord::Base
  include Concerns::DistanceCalculation
end
