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

end