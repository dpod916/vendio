class ApplicationRecord < ActiveRecord::Base


  self.abstract_class = true

  acts_as_followable

  resourcify

  def dash_param
    "#{self.class.name}-#{self.id}"
  end

  def parentable
    nil
  end

  def self.tokens(query)
   items = where("name like ?", "%#{query}%")
   # users =  User.find{|k, v| v.include?(query)}
   return items
  end

  attr_reader :user_tokens

  def user_tokens=(tokens)
    self.user_ids = User.ids_from_tokens(tokens)
  end

  attr_reader :contact_tokens

  def contact_tokens=(tokens)
    self.contactable_ids = User.ids_from_tokens(tokens)
  end

  def get_activities
    get_activities = PublicActivity::Activity.where(owner_id: self.id, owner_type: self.class.name).or(
                     PublicActivity::Activity.where(recipient_id: self.id, recipient_type: self.class.name).or(
                     PublicActivity::Activity.where(trackable_id: self.id, trackable_type: self.class.name)))

    get_activities.includes({owner: :profile}, :trackable, {recipient: :profile}) do |activities|
      activities.includes({trackable: :profile}).where.not(trackable_type: ["Profile", "Attachment"])
    end


    return get_activities.order('created_at DESC')
  end

  def group_activities
    group_activities = PublicActivity::Activity.where(owner_id: self.id, owner_type: self.class.name).or(
                        PublicActivity::Activity.where(recipient_id: self.id, recipient_type: self.class.name).or(
                         PublicActivity::Activity.where(trackable_id: self.id, trackable_type: self.class.name).or(
                          PublicActivity::Activity.where(owner_id: self.user_ids, owner_type: 'User').or(
                           PublicActivity::Activity.where(recipient_id: self.user_ids, recipient_type: 'User').or(
                            PublicActivity::Activity.where(trackable_id: self.user_ids, trackable_type: 'User'))))))
    group_activities.includes({owner: :profile}, :trackable, {recipient: [:profile, {users: :profile}]}) do |activities|
      activities.includes({trackable: [:profile, {users: :profile}]}).where.not(trackable_type: ["Profile", "Attachment"])
    end

    return group_activities.order('created_at DESC')
  end


  def user_groups
    ['User', 'Office', 'Location', 'Company',
    'OperatingCompany', 'ProfitCenter', 'Function',
    'Division', 'Department', 'BusinessUnit']
  end

  def user_or_group?
    user_groups.include?(self.class.name) ? true : false
  end


  def set_user
    User.current_user.nil? ? nil : self.user = User.current_user
  end


end

