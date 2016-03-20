class AnimalContact < ActiveRecord::Base

  belongs_to :animal
  belongs_to :contact

end