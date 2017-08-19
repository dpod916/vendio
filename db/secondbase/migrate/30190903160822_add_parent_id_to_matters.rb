class AddParentIdToMatters < ActiveRecord::Migration[5.0]
  def change
    add_column :matters, :parent_id, :integer
  end
end
