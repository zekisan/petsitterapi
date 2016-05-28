# == Schema Information
#
# Table name: animal_sitters
#
#  id         :integer          not null, primary key
#  animal_id  :integer
#  sitter_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnimalSitter < ActiveRecord::Base

  belongs_to :animal
  belongs_to :sitter

end
