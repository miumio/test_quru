class CreateTests < ActiveRecord::Migration[7.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :category_id

      t.timestamps
    end
  end
end
