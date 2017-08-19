class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :legal_name
      t.string :type
      t.integer :parent_id
      t.float :lng
      t.float :lat
      t.string :address

      t.timestamps
    end
  end
end
