class AddPhoneAndWebsiteToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :phone, :string
    add_column :vendors, :website, :string
  end
end
