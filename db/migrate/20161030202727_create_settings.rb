class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.integer :portal_id, uniq: true
      t.string :sms_recepient
      t.string :additional_emails
      t.text :human_intelligence
      t.timestamps
    end
  end
end
