class CreateDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :domains do |t|
      t.integer :portal_id, index: true, null: false
      t.string :name

      t.timestamps
    end
  end
end
