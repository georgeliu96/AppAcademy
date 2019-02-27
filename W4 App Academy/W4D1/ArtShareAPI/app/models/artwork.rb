# == Schema Information
#
# Table name: artworks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: { scope: :title,
        message: "Every artist can only have one work of the same title" }
    validates :artist_id, :title, :image_url, presence: true 

    belongs_to :artist,
        class_name: :User,
        foreign_key: :artist_id

    has_many :shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id

    has_many :shared_viewers,
    through: :shares,
    source: :viewer

end
