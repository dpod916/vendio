class AddNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :title, :string
    add_column :matters, :name, :string
    add_column :matters, :title, :string
    add_column :tasks, :name, :string
    add_column :tasks, :title, :string
    add_column :issues, :name, :string
    add_column :issues, :title, :string
  end
end
