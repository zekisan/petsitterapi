class UsersController < ApplicationController

  def insert_photo
    photo = Photo.create(image: params[:image])
    user = User.find(params[:id])
    user.photo = photo
    user.save
    render json: 'ok'
  end

end