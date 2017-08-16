class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :profilable, polymorphic: true
      t.attachment :avatar
      t.string :avatar_url
      t.text :description
      t.string :name
      t.string :title
      t.string :tag_line
      t.timestamps
    end
  end
end
