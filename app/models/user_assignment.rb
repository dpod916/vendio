class UserAssignment < ApplicationRecord
  # validates :user, uniqueness: { scope: :assignable }
  ROLE_ORDERS = ['"Owner"', '"Admin"', '"Participant"', '"Contact"', '"Reviewer"']

  scope :order_by_role, -> {
    order_by = ['case']
    ROLE_ORDERS.each_with_index do |role, index|
      order_by << "WHEN role=#{role} THEN #{index}"
    end
    order_by << 'end'
    order(order_by.join(' '))
  }

  belongs_to :user
  belongs_to :assignable, polymorphic: true
  scope :accept, -> { where(accepted: true) }
  scope :pending, -> { where(accepted: nil) }
  scope :rejected, -> { where(accepted: false) }
  scope :owner, -> { where(role: 'Owner') }
  scope :admin, -> { accept.where(role: 'Admin') }
  scope :participant, -> { accept.where(role: 'Participant') }
  scope :reviewer, -> { accept.where(role: 'Reviewer') }
  scope :viewer, -> { accept.where(role: 'Viewer') }
  scope :subject, -> { where(role: 'Subject') }
  delegate :start_date, :due_date, :title, :description, to: :assignable, allow_nil: true





  private



end

