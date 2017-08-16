class WorkOrder < SubAgreement
  belongs_to :agreement, class_name: "Agreement", primary_key: :id, foreign_key: :parent_id, optional: true
  has_one :vendor, through: :agreement
  has_one :company, through: :agreement


  private

    def set_type # If you don't implement this method, an error will be raised
      self.type = 'WorkOrder'
    end

end
