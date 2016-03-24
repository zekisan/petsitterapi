# == Schema Information
#
# Table name: animal_contacts
#
#  id         :integer          not null, primary key
#  animal_id  :integer
#  contact_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnimalContact < ActiveRecord::Base

  belongs_to :animal
  belongs_to :contact

end
