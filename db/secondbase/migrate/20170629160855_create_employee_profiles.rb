class CreateEmployeeProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_profiles do |t|
      t.string :business_partner_id
      t.string :business_unit
      t.string :company
      t.string :compensation_eligible
      t.string :cost_center
      t.string :country_code
      t.string :country_id
      t.string :created_on
      t.string :default_locale
      t.string :department
      t.string :distinguished_name
      t.string :division
      t.string :domain
      t.string :email
      t.string :employee_external_id
      t.string :employee_guid
      t.string :employee_id
      t.string :employee_source_id
      t.string :expiration
      t.string :first_name
      t.string :function
      t.string :functional_manager_id
      t.string :gender
      t.string :global_employee_id
      t.string :grade
      t.string :hire_date
      t.string :is_active
      t.string :is_locked
      t.string :is_manager
      t.string :job_title
      t.string :last_name
      t.string :location
      t.string :manager_id
      t.string :manager_user_account_id
      t.string :middle_name
      t.string :notes_canonical_name
      t.string :object_guid
      t.string :performance_plan
      t.string :preferred_name
      t.string :preferred_name_normalized
      t.string :primary_user_account_id
      t.string :salary_ref_country_id
      t.string :segment
      t.string :source_system_id
      t.string :status_id
      t.string :timezone
      t.string :title
      t.string :updated_on
      t.string :user_account_id
      t.string :user_info
      t.string :username
      t.string :version
      t.integer :old_user_id, :unique => true
      t.references :user, :unique => true

      t.timestamps
    end
  end
end
