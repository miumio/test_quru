class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :test_id

      t.timestamps
    end
  end
end
