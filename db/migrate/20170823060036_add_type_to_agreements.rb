class AddTypeToAgreements < ActiveRecord::Migration[5.1]
  def change
    add_column :agreements, :type, :string
  end
end
