class AdminAbility
  include CanCan::Ability
  
  #definisco cosa può fare un user
  def initialize(user)
    return unless user && user.superadmin_role?
    can :access,    :rails_admin
    can :dashboard               # allow access to dashboard
    can :manage,    :all
  end
end