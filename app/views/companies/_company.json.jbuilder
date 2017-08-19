json.extract! company, :id, :name, :legal_name, :lng, :lat, :full_address, :created_at, :updated_at
json.url company_url(company, format: :json)
