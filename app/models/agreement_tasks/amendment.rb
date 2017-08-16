class Amendment < Task
has_one :agreement_amendment
before_save :set_type
belongs_to :agreement, class_name: "Agreement", primary_key: :id, foreign_key: :parent_id, optional: true
belongs_to :work_order, class_name: "WorkOrder", primary_key: :id, foreign_key: :parent_id, optional: true
belongs_to :amendable, class_name: "Matter", primary_key: :id, foreign_key: :parent_id, optional: true
has_one  :agreement_party, through: :agreement
has_one  :vendor, through: :agreement_party
has_one  :company, through: :agreement_party
# has_one :negotiation, through: :amendment_negotiation

  private

    def set_type # If you don't implement this method, an error will be raised
      self.type = 'Amendment'
    end

end


