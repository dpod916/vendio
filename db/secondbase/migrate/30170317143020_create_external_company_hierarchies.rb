class CreateExternalCompanyHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :external_company_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :external_company_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "external_company_anc_desc_idx"

    add_index :external_company_hierarchies, [:descendant_id],
      name: "external_company_desc_idx"
  end
end
