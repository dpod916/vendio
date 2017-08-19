class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :old_id, index: true, unique: true
      t.integer :parent_id, index: true
      t.string  :type
      t.timestamps null: false
    end
  end
end


