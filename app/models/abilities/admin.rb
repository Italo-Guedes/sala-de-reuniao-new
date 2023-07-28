# frozen_string_literal: true

module Abilities
  # Permission class for admin
  class Admin
    include CanCan::Ability

    def initialize(user)
      cannot :manage, Notification
      can :read, User
      
      #Permissões para space
      can %i[read update create destroy], Space

      #Permissões para Reservation
      can %i[read create update destroy], Reservation

      can :destroy, Reservation

      can %i[new create edit update destroy], User
      cannot %i[destroy], User, id: user.id
      cannot %i[edit update destroy], User, roles: { name: :super_admin }

      can %i[index edit update], GlobalSetting
    end
  end
end
