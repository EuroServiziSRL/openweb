#classe usata da rails_admin per definire le cose che può fare
class AdminAbility
  include CanCan::Ability
  
  #definisco cosa può fare un user
  def initialize(user)
    
    return if !user || !user.superadmin_role?
    if user.superadmin_role?
      can :access,    :rails_admin
      can :manage,    :all
    end
  end
end