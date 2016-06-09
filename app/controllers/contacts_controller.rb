# == Schema Information
#
# Table name: contacts
#
#  id           :integer          not null, primary key
#  sitter_id    :integer
#  pet_owner_id :integer
#  date_start   :string
#  date_final   :string
#  time_start   :string
#  time_final   :string
#  created_at   :datetime
#  updated_at   :datetime
#  total_value  :decimal(7, 2)
#  status_cd    :integer          default(10)
#  app_id       :string
#

class ContactsController < ApplicationController

  before_filter :get_contact

  def update_status
    if @contact.update(status_cd: params[:status])
      @contact.notify_status_update
      render json: 'ok'
    else
      render json: @contact.errors.messages
    end
  end

  def save_summary
    photo = Photo.create(app_id: params[:photo_app_id], image: params[:image])
    @contact.summaries.build(
                          app_id: params[:summary_app_id],
                          text: params[:text],
                          created_at: params[:created_at],
                          photo: photo
    )
    @contact.save
    render json: @contact.contact_json
  end

  private

  def get_contact
    @contact = Contact.find_by_app_id params[:app_id]
  end

end
