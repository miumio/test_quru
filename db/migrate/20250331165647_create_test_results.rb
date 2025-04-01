class CreateTestResults < ActiveRecord::Migration[7.2]
  def change
    create_table :test_results do |t|
        t.integer :test_progress, null: false, default: 0
        t.references :test, null: false, foreign_key: true
        t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
