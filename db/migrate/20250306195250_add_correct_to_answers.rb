class AddCorrectToAnswers < ActiveRecord::Migration[7.2]
  def change
    add_column :answers, :correct, :boolean
  end
end
