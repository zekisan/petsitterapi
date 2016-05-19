# == Schema Information
#
# Table name: pet_cares
#
#  id     :integer          not null, primary key
#  care   :string
#  pet_id :integer
#

class PetCare < ActiveRecord::Base

  belongs_to :pet

  def pet_care_json
    { care: self.care}
  end

end
