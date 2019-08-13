class Answer < ApplicationRecord
  belongs_to :question
  validates :content, :status, :question_id, precense: true
end
