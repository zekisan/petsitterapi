class SummariesController < ApplicationController

  def insert_photo
    photo = Photo.create(app_id: params[:photo_app_id], image: params[:image])
    Summary.find_by_app_id(params[:app_id]).update(photo: photo)
    render json: 'ok'
  end

end