class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, default: true, null: false

      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
