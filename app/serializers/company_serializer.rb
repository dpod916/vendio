class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :legal_name, :lng, :lat, :full_address
end
