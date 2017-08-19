class CreateRuleBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :rule_books do |t|
      t.references :external_company, foreign_key: true
      t.string :url
      t.string :language
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
