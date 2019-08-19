class CreateOnboardingAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :onboarding_answers do |t|
      t.string :answer
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
