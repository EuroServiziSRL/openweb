class AdminAbility
  include CanCan::Ability
  
  #definisco cosa può fare un user
  def initialize(user)
    return if !user
    if user.superadmin_role?
      can :access,    :rails_admin
      can :manage,    :all
    end
  
    can :dashboard               # allow access to dashboard
    can :manage,    :all
  
  end
end