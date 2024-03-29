class Poll < ApplicationRecord 

    validates :user_id, presence: true 
    validates :title, presence: true, uniqueness: true

    belongs_to :author, 
        primary_key: :id,
        foreign_key: :user_id, 
        class_name: :User

    has_many :questions, 
        primary_key: :id, 
        foreign_key: :poll_id,
        class_name: :Question

end