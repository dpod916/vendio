class AddNameToJobTitle < ActiveRecord::Migration[5.0]
  def change
    add_column :job_titles, :name, :string
  end
end
