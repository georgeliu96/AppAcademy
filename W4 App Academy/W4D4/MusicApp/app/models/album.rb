class Album < ApplicationRecord 

  validates :band_id, :title, :year, presence: true 
  validates :live, inclusion: {in: [true, false]}
  validates :title, uniqueness: {scope: :band_id, 
    message: "Each artist should only have one album of the same title!"}

  belongs_to :band

end 