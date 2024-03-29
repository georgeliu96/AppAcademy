# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint(8)        not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord

    validates :viewer_id, uniqueness: { scope: :artwork_id, 
        message: "Each user can only view this art once!" }
    validates :viewer_id, :artwork_id, presence: true

    belongs_to :artwork,
    class_name: :Artwork,
    foreign_key: :artwork_id

    belongs_to :viewer,
    class_name: :User,
    foreign_key: :viewer_id

end
