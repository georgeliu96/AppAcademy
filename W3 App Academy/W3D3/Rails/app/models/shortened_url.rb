# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "securerandom"
class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true 
    validates :long_url, presence: true 
    validates :user_id,  presence: true 

    
    def self.random_code
        code = SecureRandom.urlsafe_base64(22)
        while ShortenedUrl.exists?(ShortenedUrl.find_by(short_url: code))
            code = SecureRandom.urlsafe_base(22) 
        end 
        return code 
    end

    def self.new_short(user, long_url)
        code = ShortenedUrl.random_code 
        ShortenedUrl.create!(short_url: code, long_url: long_url, user_id: user.id)
    end 

    belongs_to :submitter, 
        class_name: :User,
        primary_key: :id, 
        foreign_key: :user_id 

    has_many :visits,
        class_name: :Visit, 
        primary_key: :id, 
        foreign_key: :short_url_id

    has_many :visitors, 
        -> { distinct }, 
        through: :visits,
        source: :visitor

    def num_clicks
        self.visits.length
    end

    def num_uniques
        self.visitors.length
    end

    def num_recent_uniques
        count = 0
        self.visitors.each do |visit|
            created = (Time.now - visit.created_at) / 60
            count += 1 if created <= 10 
        end
        count
    end



end 
