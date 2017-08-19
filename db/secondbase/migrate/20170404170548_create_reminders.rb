class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.datetime :sent_on
      t.references :remindor, polymorphic: true
      t.references :remindee, polymorphic: true
      t.references :remindable, polymorphic: true

      t.timestamps
    end
  end
end
