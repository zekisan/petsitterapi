# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  name     :string
#  email    :string
#  photo    :string
#  logged   :boolean
#  category :integer
#

class User < ActiveRecord::Base

end
