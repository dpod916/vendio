class AddStatusToIssues < ActiveRecord::Migration[5.0]
  def change
    add_reference :issues, :status, foreign_key: true
  end
end
