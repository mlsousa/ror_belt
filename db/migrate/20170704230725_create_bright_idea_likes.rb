class CreateBrightIdeaLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bright_idea_likes do |t|
      t.references :user, foreign_key: true
      t.references :bright_idea, foreign_key: true

      t.timestamps
    end
  end
end
