# == Schema Information
#
# Table name: sitter_profile_photos
#
#  id        :integer          not null, primary key
#  image     :string
#  sitter_id :integer
#

class SitterProfilePhoto < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :sitter

end
