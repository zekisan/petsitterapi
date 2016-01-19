class CareSitter < ActiveRecord::Base

  belongs_to :sitter
  belongs_to :care

end
