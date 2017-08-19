class CreateExternalCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :external_companies do |t|
      t.string :company_name_id
      t.string :name
      t.string :short_name
      t.string :url
      t.string :year_founded
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.string :full_time_employees
      t.string :company_type
      t.string :company_category
      t.string :revenue_source
      t.string :business_model
      t.string :social_impact
      t.string :description
      t.string :description_short
      t.string :source_count
      t.string :data_types
      t.string :example_uses
      t.string :data_impacts
      t.string :financial_info
      t.string :last_updated
      t.integer :parent_id
      t.timestamps
    end
  end
end
