class Ability
  include CanCan::Ability

  def initialize(user)
    can :view_food, Food, user:
  end
end
