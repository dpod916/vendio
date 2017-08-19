class CreateTodoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_items do |t|
      t.references :listable, polymorphic: true
      t.references :todo_list, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
