class AddDeadlineToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :deadline, :integer, null: false, default: 7
  end
end
