class CreateBrightIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :bright_ideas do |t|
      t.string :idea
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
