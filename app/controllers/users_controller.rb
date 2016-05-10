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
#

class UsersController < ApplicationController

  def insert_photo
    photo = Photo.create(image: params[:image])
    user = User.find(params[:id])
    user.photo = photo
    user.save
    render json: 'ok'
  end

  def login
    user = User.find_by_email(params[:email])

    if user.nil? || user.password != params[:password]
      render json: { error: "user_invalid" }, status: :not_found
    else
      render json: user.user_json
    end
  end

  def logout
    user = User.find(params[:id])

    if user.nil?
      render json: { error: "user_invalid" }, status: :not_found
    else
      user.update(device_token: nil)
      render json: 'ok'
    end
  end

  def update_device_token
    user = User.find(params[:id])
    user.update(device_token: params[:token])
    render json: 'ok'
  end

end
