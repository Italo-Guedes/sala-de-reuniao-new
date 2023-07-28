# frozen_string_literal: true

module Abilities
  # Permission class for super admin role
  class DefaultUser
    include CanCan::Ability

    def initialize(user)
      can %i[index mark_read mark_all_read], Notification, user_id: user.id

      #Permissões para Espaços
      can %i[read show], Space
      
      #Permissões para reservas
      can %i[create update], Reservation
      can %i[read], Reservation, user_id: user.id
      can :destroy, Reservation, user_id: user.id
      cannot %i[destroy], Reservation do |reservation|
        reservation.date_start <= Time.now
      end
    end
  end
end
