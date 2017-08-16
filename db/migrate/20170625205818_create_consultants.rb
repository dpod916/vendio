class CreateConsultants < ActiveRecord::Migration[5.0]
  def change
    create_table :consultants do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
