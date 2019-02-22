class Response < ApplicationRecord

    validates :user_id, presence: true
    validates :answer_choice_id, presence: true
    validate :respondent_already_answered?

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :answer_choice,
        primary_key: :id, 
        foreign_key: :answer_choice_id,
        class_name: :AnswerChoice 

    has_one :question, 
        through: :answer_choice,
        source: :question 

    def sibling_responses
        self.question.responses.where.not(id: self.id)  
    end

    def respondent_already_answered?
        if self.sibling_responses.select(user_id).exists?(self.user_id)
            errors[:sibling] << 'Can\'t respond to the same question twice!'
        end
    end

end