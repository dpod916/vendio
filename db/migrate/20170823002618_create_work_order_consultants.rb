class CreateWorkOrderConsultants < ActiveRecord::Migration[5.1]
  def change
    create_table :work_order_consultants do |t|
      t.references :work_order, foreign_key: true
      t.references :consultant, foreign_key: true

      t.timestamps
    end
  end
end
