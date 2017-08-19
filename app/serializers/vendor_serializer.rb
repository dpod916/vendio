class VendorSerializer < ActiveModel::Serializer
  attributes :id, :name, :legal_name, :type, :parent_id, :lng, :lat, :""
end
