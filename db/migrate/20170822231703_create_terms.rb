class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.date :start
      t.date :end
      t.references :termable, polymorphic: true
      t.integer :version
      t.boolean :active

      t.timestamps
    end
  end
end
