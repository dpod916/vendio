class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :legal_name
      t.float :lng
      t.float :lat
      t.string :full_address
      t.timestamps
    end
  end
end
