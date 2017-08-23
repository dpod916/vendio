class WorkOrder < ApplicationRecord
  belongs_to :vendor
  belongs_to :company
  belongs_to :agreement
end
