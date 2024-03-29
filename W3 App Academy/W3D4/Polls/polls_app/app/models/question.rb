class Question < ApplicationRecord

    validates :poll_id, presence: true
    validates :text, presence: true

    belongs_to :poll, 
        primary_key: :id,
        foreign_key: :poll_id, 
        class_name: :Poll

    has_many :answer_choices,
        primary_key: :id, 
        foreign_key: :question_id, 
        class_name: :AnswerChoice

    has_many :responses, 
        through: :answer_choices,
        source: :responses


end