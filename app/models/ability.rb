class Ability
  include CanCan::Ability

  def initialize(user)

    if user.admin?
        can :manage, :all
        # not work as my If cond. in course & lecture controller&view 
                # current_user must be owner of course | lecture to manage them 
                # but admin can manage them now from admin only        
    else
        # can :update, Lecture do |lecture|
        #     lecture.course.user == user
        # end
        # can :destroy, Lecture do |lecture|
        #     lecture.course.user == user
        # end

        can :destroy, Comment do |comment|
            comment.user == user
        end

        #can :create, Lecture
        can :create, Comment
        
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
end
