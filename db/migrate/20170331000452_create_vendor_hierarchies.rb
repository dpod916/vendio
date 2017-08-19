class CreateVendorHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_hierarchies, :id => false do |t|
      t.integer  :ancestor_id, :null => false   # ID of the parent/grandparent/great-grandparent/... vendors
      t.integer  :descendant_id, :null => false # ID of the target vendor
      t.integer  :generations, :null => false   # Number of generations between the ancestor and the descendant. Parent/child = 1, for example.
    end

    # For "all progeny of…" and leaf selects:
    add_index :vendor_hierarchies, [:ancestor_id, :descendant_id, :generations],
              :unique => true, :name => "vendor_anc_desc_udx"

    # For "all ancestors of…" selects,
    add_index :vendor_hierarchies, [:descendant_id],
              :name => "vendor_desc_idx"
  end
end