class Track < ApplicationRecord 

  validates :album_id, :title, :ord, presence: true 
  validates :bonus, inclusion: {in: [true, false]}

end 