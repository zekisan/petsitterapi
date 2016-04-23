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
#  app_id       :integer
#

class ContactsController < ApplicationController

  before_filter :get_contact

  def update_status
    if @contact.update(status_cd: params[:status])
      render json: 'ok'
    else
      render json: @contact.errors.messages
    end
  end

  private

  def get_contact
    @contact = Contact.find params[:id]
  end

end
