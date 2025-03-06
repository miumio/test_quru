class AddDefaultLevelToTests < ActiveRecord::Migration[7.2]
  def change
    change_column_default :tests, :level, from: nil, to: 1
  end
end
