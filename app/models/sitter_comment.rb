# == Schema Information
#
# Table name: sitter_comments
#
#  id      :integer          not null, primary key
#  text    :string
#  rate_id :integer
#

class SitterComment < ActiveRecord::Base

  belongs_to :rate

end
