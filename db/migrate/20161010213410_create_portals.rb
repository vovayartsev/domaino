class CreatePortals < ActiveRecord::Migration[5.0]
  def change
    create_table :portals do |t|
      t.string :plan
      t.string :email
      t.string :heroku_uuid
      # t.integer :lock_version

      t.timestamps
    end
  end
end
