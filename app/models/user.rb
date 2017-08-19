class User < SecondBase::Base
  include Assignments
  include PublicActivity::Model
  has_many :attachments

  # @admin = Profile.where(name: 'Daniel Podvesker').first.profilable
  # tracked owner: @admin,
  #         title: :name,
  #         :params => {
  #             :changes => Proc.new {|controller, model| model.changes.to_json}
  #         }


  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

       #scopes for each users activity, this will give us access to all models (assignments, comments, posts etc..)
      #by calling one polymorphic association record (trackable) within the activities model
      #this is how we will create activity and news feeds for each user

  #scopes for trainings

  has_many :owned_activities, -> { includes(:trackable, :recipient, :owner) }, as: :owner, source: :activity
  has_many :tracked_activities, -> { includes(:trackable, :recipient, :owner) }, as: :trackable, source: :activity
  has_many :received_activities, -> { includes(:trackable, :recipient, :owner) }, as: :recipient, source: :activity
  scope :activities, -> {self.tracked_activities + self.received_activities + self.owned_activities}

  has_many :training_users
  has_many :trainings, through: :training_users, source: :training
  has_many :presented_trainings, -> { where(training_users: {role: 'Presentor'}) }, through: :training_users, source: :training
  has_many :attended_trainings, -> { where(training_users: {role: 'Attendee'}) }, through: :training_users, source: :training
  has_many :admin_trainings, -> { where(training_users: {role: 'Admin'}) }, through: :training_users, source: :training


  #users who are employees of Bunge have an employee profile which includes

  has_one :employee_profile
  # delegate :first_name, :middle_name, :last_name, :status, :title, :username, :employee_id,
  #         :business_partner_id, :created_on, :distinguished_name, :manager_id,
  #         :employee_external_id, :employee_guid, :employee_source_id, :functional_manager_id,
  #         :gender, :global_employee_id, :grade, :hire_date, :manager_user_account_id,
  #         :preferred_name, :preferred_name_normalized, :primary_user_account_id, :updated_on,
  #         :user_account_id, :parent_id,
  #         to: :employee_profile

  #will eventually switch this to reflect the below relationships represented in the users profile

  belongs_to :business_unit, optional: true
  belongs_to :company, optional: true
  belongs_to :operating_company, optional: true
  belongs_to :profit_center, optional: true
  belongs_to :department, optional: true
  belongs_to :division, optional: true
  belongs_to :function, optional: true
  belongs_to :office, optional: true
  has_one :location, through: :office
  belongs_to :segment, optional: true
  belongs_to :country, optional: true

  delegate :name, to: :business_unit, prefix: true, allow_nil: true
  delegate :name, to: :company, prefix: true, allow_nil: true
  delegate :name, to: :profit_center, prefix: true, allow_nil: true
  delegate :name, to: :department, prefix: true, allow_nil: true
  delegate :name, to: :division, prefix: true, allow_nil: true
  delegate :name, to: :function, prefix: true, allow_nil: true
  delegate :name, to: :office, prefix: true, allow_nil: true
  delegate :name, to: :location, prefix: true, allow_nil: true
  delegate :name, to: :segment, prefix: true, allow_nil: true
  delegate :name, to: :country, prefix: true, allow_nil: true


  belongs_to :manager, class_name: "User", primary_key: :parent_id, foreign_key: :id, optional: true
  has_many :users, class_name: "User", primary_key: :parent_id, foreign_key: :id

  # has_closure_tree with_advisory_lock: false, dependent: :delete_all

  has_closure_tree

  #target for notifications

  acts_as_target

  #all models act_as_followable as defined in application_record.rb
  #acts_as_follower gives users the ability to follow the other models


  acts_as_follower

  include Opinions::Opinionated
  opinions :like

  self.inheritance_column = :type


# to call all your friends

  def friends
    active_friends | received_friends
  end

# to call your pending sent or received

  def pending
      pending_friends | requested_friendships
  end

# full name and employee name functions are used to populate the name field in the
# profile owned by the user

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def employee_name
   self.distinguished_name.nil? ? self.full_name : self.distinguished_name.split(",")[0].gsub!("CN=", "")
  end

  def headers
    headers = ["Matters", "Tasks", "Issues"]
  end

  def self.tokens(query)
   items = User.where("name like ?", "%#{query}%")
   # users =  User.find{|k, v| v.include?(query)}
   return items
  end

  def self.ids_from_tokens(tokens)
   tokens.gsub!(/<<<(.+?)>>>/)
   tokens.split(',')
  end

  def user_details
     ["office", "function", "division", "profit_center", "department", "business_unit"]
  end

  def training_admin()
    self.admin_trainings
  end

  def admins
    [2644]
  end

  def admin?
    admins.include?(self.id)
  end

end
