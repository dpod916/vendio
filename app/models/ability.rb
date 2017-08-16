class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      # user ||= current_user # guest user (not logged in)
      if user.admin?
        can :manage, :all
      end


      can [:read, :update], Matter, :id => user.matters.pluck(:id)
      can [:read, :update], Task, :id => user.tasks.pluck(:id)
      can [:read, :update], Issue, :id => user.issues.pluck(:id)

      can :read, Matter, :id => user.pending_matters.pluck(:id)
      can :read, Task, :id => user.pending_tasks.pluck(:id)
      can :read, Issue, :id => user.pending_issues.pluck(:id)

      can :manage, Matter, :id => user.admin_matters.pluck(:id)
      can :manage, Task, :id => user.admin_tasks.pluck(:id)
      can :manage, Issue, :id => user.admin_issues.pluck(:id)

      can [:read], Training, :id => user.trainings.pluck(:id)
      can [:manage], Training, :id => user.admin_trainings.pluck(:id)
      can [:manage], Training, :id => user.presented_trainings.pluck(:id)


      can :create, Comment
      can [:update, :delete], Comment do |comment|
        comment.try(:user) == user
      end

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

   def current_ability
     @current_ability ||= Ability.new(current_user)
   end
end
