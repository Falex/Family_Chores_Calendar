class Abilty
  include CanCan:Abilty
  
  def initialize(user)
    can :read, :all
  end
end