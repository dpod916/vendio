class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.references :issuable, polymorphic: true
      t.references :priority, foreign_key: true
      t.date :start_date
      t.date :due_date
      t.references :severity, foreign_key: true
      t.boolean :non_compliance
      t.boolean :regulatory_impact
      t.boolean :confidential

      t.timestamps
    end
  end
end
