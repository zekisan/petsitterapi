class AnimalSitter < ActiveRecord::Base

  belongs_to :sitter
  belongs_to :animal

end
