class CreateTests < ActiveRecord::Migration[7.2]
  def change
    create_table :tests do |t|
      t.string :title, null: false 
      t.string :test_author
      t.integer :level, default: 1
      
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end