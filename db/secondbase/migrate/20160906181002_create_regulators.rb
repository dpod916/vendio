class CreateRegulators < ActiveRecord::Migration[5.0]
  def change
    create_table :regulators do |t|
      t.string :long_name
      t.string :short_name
      t.string :website
      t.string :category
      t.string :rulebook

      t.timestamps
    end
  end
end
