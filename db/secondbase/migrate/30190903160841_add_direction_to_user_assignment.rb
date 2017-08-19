class AddDirectionToUserAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :user_assignments, :direction, :string
  end
end
