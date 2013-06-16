class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, [Review, Venue]
    cannot [:create, :update, :destroy], :all
    if user.role == 'admin'
      can :manage, :all
    elsif user.id
      can :manage, [Review, User, Venue], user_id: user.id
      cannot :destroy, Venue
    end

  end
end

