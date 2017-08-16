module Assignments
   extend ActiveSupport::Concern

   included do
      include Profilable

      #scopes for all assignables, this will give us access to all matters, tasks, and issues etc..
      #by calling one polymorphic association record { assignable } within the user_assignments relationship
      has_many :user_assignments, -> { where.not(role: 'Subject').includes(:assignable) }

      has_many :assignables, through: :user_assignments
      has_many :pending_assignments, -> { where(user_assignments: {accepted: nil}) }, through: :user_assignments
      has_many :rejected_assignments, -> { where(user_assignments: {accepted: false}) }, through: :user_assignments
      has_many :requested_assignments, -> { where(user_assignments: {direction: 'user.to.item'}) }, through: :pending_assignments
      has_many :received_assignments, -> { where(user_assignments: {direction: 'item.to.user'}) }, through: :pending_assignments

      has_many :matters, -> { where(user_assignments: {accepted: true}) }, through: :user_assignments, source: :assignable, source_type: 'Matter'
      has_many :pending_matters, -> { where(user_assignments: {accepted: nil}) }, through: :user_assignments, source: :assignable, source_type: 'Matter'
      has_many :requested_matters, -> { where(user_assignments: {direction: 'user.to.item'}) }, through: :pending_matters, source: :assignable, source_type: 'Matter'
      has_many :received_matters, -> { where(user_assignments: {direction: 'item.to.user'}) }, through: :pending_matters, source: :assignable, source_type: 'Matter'
      has_many :rejected_matters, -> { where(user_assignments: {accepted: false}) }, through: :user_assignments, source: :assignable, source_type: 'Matter'

      has_many :tasks, -> { where(user_assignments: {accepted: true}) }, through: :user_assignments, source: :assignable, source_type: 'Task'
      has_many :pending_tasks, -> { where(user_assignments: {accepted: nil}) }, through: :user_assignments, source: :assignable, source_type: 'Task'
      has_many :requested_tasks, -> { where(user_assignments: {direction: 'user.to.item'}) }, through: :pending_tasks, source: :assignable, source_type: 'Task'
      has_many :received_tasks, -> { where(user_assignments: {direction: 'item.to.user'}) }, through: :pending_tasks, source: :assignable, source_type: 'Task'
      has_many :rejected_tasks, -> { where(user_assignments: {accepted: false}) }, through: :user_assignments, source: :assignable, source_type: 'Task'


      has_many :issues, -> { where(user_assignments: {accepted: true}) }, through: :user_assignments, source: :assignable, source_type: 'Issue'
      has_many :pending_issues, -> { where(user_assignments: {accepted: nil}) }, through: :user_assignments, source: :assignable, source_type: 'Issue'
      has_many :requested_issues, -> { where(user_assignments: {direction: 'user.to.item'}) }, through: :pending_issues, source: :assignable, source_type: 'Issue'
      has_many :received_issues, -> { where(user_assignments: {direction: 'item.to.user'}) }, through: :pending_issues, source: :assignable, source_type: 'Issue'
      has_many :rejected_issues, -> { where(user_assignments: {accepted: false}) }, through: :user_assignments, source: :assignable, source_type: 'Issue'

      has_many :admin_matters, -> { where(user_assignments: {accepted: true, role: 'Admin'}) }, through: :user_assignments, source: :assignable, source_type: 'Matter'
      has_many :admin_tasks, -> { where(user_assignments: {accepted: true, role: 'Admin'}) }, through: :user_assignments, source: :assignable, source_type: 'Task'
      has_many :admin_issues, -> { where(user_assignments: {accepted: true, role: 'Admin'}) }, through: :user_assignments, source: :assignable, source_type: 'Issue'


      # has_many :open_matters, -> { where(matters: { open}) }, source: :assignable, source_type: 'Matter'
      # has_many :closed_matters, -> { self.matters.closed }, source: :assignable, source_type: 'Matter'
      # has_many :open_tasks, -> { self.tasks.open }, source: :assignable, source_type: 'Task'
      # has_many :closed_tasks, -> { self.tasks.closed }, source: :assignable, source_type: 'Task'
      # has_many :open_issues, -> { self.issues.open }, source: :assignable, source_type: 'Issue'
      # has_many :closed_issues, -> { self.issues.closed }, source: :assignable, source_type: 'Issue'


   end
end

