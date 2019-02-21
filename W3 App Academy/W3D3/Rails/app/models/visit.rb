# == Schema Information
#
# Table name: visits
#
#  id           :bigint(8)        not null, primary key
#  short_url_id :integer          not null
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Visit < ApplicationRecord 

    def self.record_visit!(user, shortened_url)
        Visit.create!(short_url_id: shortened_url.id, user_id: user.id)
    end 

    belongs_to :visitor,
        class_name: :User, 
        primary_key: :id, 
        foreign_key: :user_id

    belongs_to :short_url, 
        class_name: :ShortenedUrl,
        primary_key: :id,
        foreign_key: :short_url_id

    
end

