# == Schema Information
#
# Table name: rates
#
#  id         :integer          not null, primary key
#  positive   :boolean
#  contact_id :integer
#

class Rate<ActiveRecord::Base

  belongs_to :contact

  has_one :sitter_comment
  has_one :pet_owner_comment

  accepts_nested_attributes_for :sitter_comment
  accepts_nested_attributes_for :pet_owner_comment

end
