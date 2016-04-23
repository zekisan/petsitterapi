# == Schema Information
#
# Table name: pet_owner_comments
#
#  id      :integer          not null, primary key
#  text    :string
#  rate_id :integer
#

class PetOwnerComment < ActiveRecord::Base

  belongs_to :rate

end
