class WorkOrderConsultant < ApplicationRecord
  belongs_to :work_order
  belongs_to :consultant
end
