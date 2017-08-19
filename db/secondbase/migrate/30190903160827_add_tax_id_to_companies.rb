class AddTaxIdToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :tax_id, :string
  end
end
