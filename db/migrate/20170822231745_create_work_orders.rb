class CreateWorkOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :work_orders do |t|
      t.references :vendor, foreign_key: true
      t.integer :company_id, foreign_key: true
      t.references :agreement, foreign_key: true

      t.timestamps
    end
  end
end
