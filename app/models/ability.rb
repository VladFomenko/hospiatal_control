# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.is_a?(Client)
      can %i[show update delete], Client, id: user.id
      can :read, Doctor
      can %i[read update create], Visit, client_id: user.id
    elsif user.is_a?(Doctor)
      can %i[show update], Doctor, id: user.id
      can %i[read update], Visit, doctor_id: user.id
      can :read, Client do |client|
        Visit.exists?(doctor_id: user.id, client_id: client.id)
      end
    end
  end
end
