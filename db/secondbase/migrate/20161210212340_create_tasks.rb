class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :priority, foreign_key: true
      t.date :start_date
      t.date :due_date
      t.string :type
      t.references :taskable, polymorphic: true

      t.timestamps
    end
  end
end
