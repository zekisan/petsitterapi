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

class Rate<ActiveRecord::Base

  belongs_to :contact

end
