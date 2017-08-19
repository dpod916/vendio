class CreateProfitCenters < ActiveRecord::Migration[5.0]
  def change
    create_table :profit_centers do |t|
      t.string :name
      t.timestamps
    end
  end
end
