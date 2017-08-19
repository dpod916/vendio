class AddRelationsToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.references :company, foreign_key: true
      t.references :profit_center, foreign_key: true
      t.references :office, foreign_key: true
      t.references :function, foreign_key: true
      t.references :segment, foreign_key: true
      t.references :business_unit, foreign_key: true
      t.references :department, foreign_key: true
      t.references :division, foreign_key: true
      t.integer :manager_id, index: true
    end
  end
end
