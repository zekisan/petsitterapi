# == Schema Information
#
# Table name: photos
#
#  id    :integer          not null, primary key
#  image :string
#

class Photo < ActiveRecord::Base

  mount_uploader :image, ImageUploader

end
