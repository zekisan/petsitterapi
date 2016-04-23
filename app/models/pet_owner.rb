# == Schema Information
#
# Table name: pet_owners
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :decimal(18, 16)
#  longitude  :decimal(18, 16)
#  district   :string
#

class PetOwner < ActiveRecord::Base
  include Concerns::DistanceCalculation

  has_many :contacts
  belongs_to :user
end
