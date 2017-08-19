class CreateConsultants < ActiveRecord::Migration[5.0]
  def change
    create_table :consultants do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :email
      t.references :vendor

      t.timestamps
    end
  end
end
