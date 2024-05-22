class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :website

      t.timestamps
    end
  end
end
