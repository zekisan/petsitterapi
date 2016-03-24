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