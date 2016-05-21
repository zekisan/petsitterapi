# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string
#  password     :string
#  entity_type  :string
#  entity_id    :integer
#  device_token :string
#  photo_id     :integer
#  app_id       :string
#

class User < ActiveRecord::Base

  belongs_to :photo

  def user_json
    {app_id: self.app_id, email: self.email, entity_type: self.entity_type, entity_id: self.entity_id,
     photo: { app_id: self.photo.app_id, thumb: self.photo.image.thumb.url, medium: self.photo.image.medium.url,
     large: self.photo.image.large.url}}
  end

end
