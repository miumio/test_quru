class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.integer :question_id, null: false, foreign_key: { to_table: :questions }
      t.boolean :correct, default: true, null: false

      t.timestamps
    end
  end
end
