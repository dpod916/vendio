class CreateMatters < ActiveRecord::Migration[5.0]
  def change
    create_table :matters do |t|
      t.references :status, foreign_key: true
      t.references :priority, foreign_key: true
      t.date :start_date
      t.date :due_date
      t.references :matterable, polymorphic: true
      
      t.timestamps
    end
  end
end
