# == Schema Information
#
# Table name: rates
#
#  id         :integer          not null, primary key
#  positive   :boolean
#  contact_id :integer
#

class RatesController < ApplicationController

  def reply_rate
    rate = Rate.find(params[:id])
    SitterComment.create(
        rate: rate,
        text: params[:text]
    )
    render json: 'ok'
  end

end
