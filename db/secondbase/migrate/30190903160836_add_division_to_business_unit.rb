class AddDivisionToBusinessUnit < ActiveRecord::Migration[5.0]
  def change
    add_reference :business_units, :division, foreign_key: true
    add_reference :departments, :function,  foreign_key: true
    add_reference :job_titles, :department,  foreign_key: true
  end
end
