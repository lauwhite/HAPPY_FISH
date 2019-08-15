class Answer < ApplicationRecord
  belongs_to :question
  validates :content, :question_id, presence: true
  validates :status, inclusion: { in: [true, false] }
end
