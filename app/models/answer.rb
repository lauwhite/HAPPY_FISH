class Answer < ApplicationRecord
  belongs_to :question
  validates :content, :question_id, presence: true
  validates_inclusion_of:status, in [true, false]S
end
