class AddReviewableToMatter < ActiveRecord::Migration[5.0]
  def change
    add_column :matters, :reviewable, :boolean
    add_column :matters, :confidential, :boolean
    add_column :tasks, :reviewable, :boolean
    add_column :tasks, :confidential, :boolean
    add_column :issues, :reviewable, :boolean
  end
end
