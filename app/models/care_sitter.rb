# == Schema Information
#
# Table name: care_sitters
#
#  id         :integer          not null, primary key
#  care_id    :integer
#  sitter_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CareSitter < ActiveRecord::Base

  belongs_to :sitter
  belongs_to :care

end
