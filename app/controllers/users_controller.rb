class UsersController < ApplicationController

  def insert_photo
    photo = Photo.create(image: params[:image])
    user = User.find(params[:user_id])
    user.photo = photo
    user.save
  end

end