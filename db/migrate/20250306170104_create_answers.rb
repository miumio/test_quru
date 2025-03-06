class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
