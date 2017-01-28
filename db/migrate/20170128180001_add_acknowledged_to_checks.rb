class AddAcknowledgedToChecks < ActiveRecord::Migration[5.0]
  def change
    add_column :checks, :acknowledged, :boolean, null: false, default: false
  end
end
