class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.float :amount
      t.string :per
      t.references :rateable, polymorphic: true

      t.timestamps
    end
  end
end
