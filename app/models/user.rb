# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string
#  password     :string
#  entity_type  :string
#  entity_id    :string
#  device_token :string
#  app_id       :string
#

class User < ActiveRecord::Base

  def user_json
    {app_id: self.app_id, email: self.email, entity_type: self.entity_type, entity_id: self.entity_id,
     device_token: self.device_token }
  end

end
