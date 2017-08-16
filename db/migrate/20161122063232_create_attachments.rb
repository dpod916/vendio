class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.attachment :file
      t.boolean :deleted
      t.references :attachable, polymorphic: true
      t.timestamps
    end
  end
end
