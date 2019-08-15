class AddImageToChallengeCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_categories, :image, :string
  end
end
