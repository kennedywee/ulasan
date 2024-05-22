class CreateFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :features do |t|
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.integer :category
      t.integer :vote_count

      t.timestamps
    end
  end
end
