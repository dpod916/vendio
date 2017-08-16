class CreateAgreements < ActiveRecord::Migration[5.0]
  def change
    create_table :agreements do |t|
      t.integer :old_id
      t.integer :agreement_number
      t.string :agreement_version
      t.text :added_text
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
