# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true

    has_many :submitted_urls,
        class_name: :ShortenedUrl,
        primary_key: :id,
        foreign_key: :user_id 

    has_many :visits, 
        class_name: :Visit, 
        primary_key: :id, 
        foreign_key: :user_id

    has_many :visited_urls, 
        through: :visits, 
        source: :short_url

    has_many :distinct_visited_urls, 
        -> {distinct},
        through: :visits, 
        source: :short_url
end 
