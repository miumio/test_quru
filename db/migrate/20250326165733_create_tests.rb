class CreateTests < ActiveRecord::Migration[7.2]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 1, null: false

      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
