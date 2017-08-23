json.extract! work_order, :id, :vendor_id, :company_id, :agreement_id, :created_at, :updated_at
json.url work_order_url(work_order, format: :json)
