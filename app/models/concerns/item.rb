module Item
   extend ActiveSupport::Concern

   included do
     include NonUser
     has_many :tracked_activities, -> { includes(:trackable, :recipient, :owner) }, as: :trackable, source: :activity
     has_many :received_activities, -> { includes(:trackable, :recipient, :owner) }, as: :recipient, source: :activity
     scope :activities, -> {self.tracked_activities + self.received_activities }
     non_participants = ['Subject']

     has_many :user_assignments, -> { where.not(role: non_participants)
                                      .where(accepted: true)
                                      .order_by_role
                                      .includes({user: :profile})},
                                      as: :assignable,
                                      dependent: :destroy

     has_many :pending_assignments, -> { where.not(role: non_participants)
                                        .where(accepted: nil)
                                        .order_by_role
                                        .includes({user: :profile})},
                                        as: :assignable

     has_many :rejected_assignments, -> { where.not(role: non_participants)
                                          .where(accepted: false)
                                          .order_by_role
                                          .includes({user: :profile})},
                                          through: :user_assignments,
                                          as: :assignable

     has_many :users, -> { where(user_assignments: { accepted: true})}, through: :user_assignments, source: :user

     has_many :admins, -> { where(user_assignments: {role: 'Admin', accepted: true}) }, through: :user_assignments, source: :user
     has_many :participants, -> { where(user_assignments: {role: 'Participant', accepted: true}) }, through: :user_assignments, source: :user
     has_many :viewers, -> { where(user_assignments: {role: 'Viewer', accepted: true}) }, through: :user_assignments, source: :user
     has_many :owners, -> { where(user_assignments: {role: 'Owner', accepted: true}) }, through: :user_assignments, source: :user
     has_many :subjects, -> { where(user_assignments: {role: 'Subject', accepted: true}) }, through: :user_assignments, source: :user
     has_many :reviewers, -> { where(user_assignments: {role: 'Reviewer', accepted: true}) }, through: :user_assignments, source: :user
     has_many :contacts, -> { where(user_assignments: {role: 'Contact', accepted: true}) }, through: :user_assignments, source: :user


     has_many :pending_admins, -> { where(user_assignments: {role: 'Admin', accepted: nil}) }, through: :user_assignments, source: :user
     has_many :pending_participants, -> { where(user_assignments: {role: 'Participant', accepted: nil}) }, through: :user_assignments, source: :user
     has_many :pending_viewers, -> { where(user_assignments: {role: 'Viewer', accepted: nil}) }, through: :user_assignments, source: :user
     has_many :pending_owners, -> { where(user_assignments: {role: 'Owner', accepted: nil}) }, through: :user_assignments, source: :user
     has_many :pending_subjects, -> { where(user_assignments: {role: 'Subject'}) }, through: :user_assignments, source: :user
     has_many :pending_reviewers, -> { where(user_assignments: {role: 'Reviewer', accepted: nil}) }, through: :user_assignments, source: :user


     has_many :rejected_admins, -> { where(user_assignments: {role: 'Admin', accepted: false}) }, through: :user_assignments, source: :user
     has_many :rejected_participants, -> { where(user_assignments: {role: 'Participant', accepted: false}) }, through: :user_assignments, source: :user
     has_many :rejected_viewers, -> { where(user_assignments: {role: 'Viewer', accepted: false}) }, through: :user_assignments, source: :user
     has_many :rejected_owners, -> { where(user_assignments: {role: 'Owner', accepted: false}) }, through: :user_assignments, source: :user
     has_many :rejected_subjects, -> { where(user_assignments: {role: 'Subject'}) }, through: :user_assignments, source: :user
     has_many :rejected_reviewers, -> { where(user_assignments: {role: 'Reviewer', accepted: false}) }, through: :user_assignments, source: :user


    attr_accessor :owner_tokens, :admin_tokens, :participant_tokens,
                  :reviewer_tokens, :subject_tokens, :contact_tokens,
                  :task_tokens

	attr_reader :owner_tokens

    def owner_tokens=(tokens)
      self.user_assignments.where(user_id: User.ids_from_tokens(tokens)).destroy_all
      self.owner_ids = User.ids_from_tokens(tokens)
    end

    attr_reader :admin_tokens

    def admin_tokens=(tokens)
      self.user_assignments.where(user_id: User.ids_from_tokens(tokens)).destroy_all
      self.admin_ids = User.ids_from_tokens(tokens)
    end

    attr_reader :participant_tokens

    def participant_tokens=(tokens)
      self.user_assignments.where(user_id: User.ids_from_tokens(tokens)).destroy_all
      self.participant_ids = User.ids_from_tokens(tokens)
    end

    attr_reader :task_tokens

    def task_tokens=(tokens)
      task_array = tokens.split('/')
      self.pending_task_ids = task_array[0].map {|t| t.to_i }
      self.started_task_ids = task_array[1].map {|t| t.to_i }
      self.completed_task_ids = task_array[2].map {|t| t.to_i }
    end

    attr_reader :reviewer_tokens

    def reviewer_tokens=(tokens)
      self.user_assignments.where(user_id: User.ids_from_tokens(tokens)).destroy_all
      self.reviewer_ids = User.ids_from_tokens(tokens)
    end

    attr_reader :subject_tokens

    def subject_tokens=(tokens)
      self.user_assignments.where(user_id: User.ids_from_tokens(tokens)).destroy_all
      self.subject_ids = User.ids_from_tokens(tokens)
    end

    attr_reader :contact_tokens

    def contact_tokens=(tokens)
      self.user_assignments.where(user_id: User.ids_from_tokens(tokens)).destroy_all
      self.contact_ids = User.ids_from_tokens(tokens)
    end

    def tabs
      ['Activity Feed', 'Todo List', 'File Manager', 'About']
    end



   end
end