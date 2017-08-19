class AddUniqueIndexToUserAssignment < ActiveRecord::Migration[5.0]
  def change
    add_index :user_assignments, [:user_id, :assignable_type, :assignable_id], unique: true, :name => 'index_user_assignments_on_user_and_assignable'
  end
end
