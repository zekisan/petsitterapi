# == Schema Information
#
# Table name: pet_owner_profile_photos
#
#  id           :integer          not null, primary key
#  image        :string
#  pet_owner_id :integer
#  app_id       :string
#

class PetOwnerProfilePhoto < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :pet_owner

end
