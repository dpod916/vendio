class CreateMatterHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :matter_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :matter_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "matter_anc_desc_idx"

    add_index :matter_hierarchies, [:descendant_id],
      name: "matter_desc_idx"
  end
end
