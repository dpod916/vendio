class CreateJobTitles < ActiveRecord::Migration[5.0]
  def change
    create_table :job_titles do |t|
      t.references :function, foreign_key: true

      t.timestamps
    end
  end
end
