# frozen_string_literal: true

module Abilities
  # Permission class for super admin role
  class SuperAdmin
    include CanCan::Ability

    def initialize(user)
      can :manage, User
      can :manage, Space
      can :manage, Reservation
      cannot :destroy, User, id: user.id
      can :manage, GlobalSetting, id: GlobalSetting.instance.id
      can :read, :deleted_records
      can :admin_pages, :sidekiq
      can :admin_pages, :database_changes
      can :admin_pages, :pghero
    end
  end
end