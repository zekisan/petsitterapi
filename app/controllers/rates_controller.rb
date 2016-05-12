# == Schema Information
#
# Table name: rates
#
#  id                :integer          not null, primary key
#  contact_id        :integer
#  stars_qtd         :integer
#  app_id            :string
#  pet_owner_comment :string
#  sitter_comment    :string
#

class RatesController < ApplicationController

  def reply_rate
    rate = Rate.find_by_app_id(params[:app_id])
    rate.update(sitter_comment: params[:sitter_comment])
    render json: 'ok'
  end

end
