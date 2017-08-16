class CreateUserAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_assignments do |t|
      t.references :user, foreign_key: true
      t.references :assignable, polymorphic: true
      t.string :role
      t.integer :assignor_id
      t.boolean :accepted

      t.timestamps
    end
    add_index :user_assignments, :assignor_id
    add_index :user_assignments, :role
    add_index :user_assignments, :accepted
  end
end
