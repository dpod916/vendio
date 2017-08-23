class WorkOrderSerializer < ActiveModel::Serializer
  attributes :id
  has_one :vendor
  has_one :company
  has_one :agreement
end
