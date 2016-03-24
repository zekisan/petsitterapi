# == Schema Information
#
# Table name: cares
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Care < ActiveRecord::Base

  has_many :care_sitters
  has_many :sitters, through: :care_sitters

end
