class CreateOnboardingQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :onboarding_questions do |t|
      t.string :question

      t.timestamps
    end
  end
end
