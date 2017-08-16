json.extract! user_assignment, :id, :user_id, :assignable_id, :role, :accepted, :created_at, :updated_at
json.url user_assignment_url(user_assignment, format: :json)
