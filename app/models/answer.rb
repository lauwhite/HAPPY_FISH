class Answer < ApplicationRecord
  belongs_to :question
  validates :content, :question_id, presence: true
  validates :boolean_field_name, inclusion: { in: [true, false] }
end
