# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    global_id_field :id
  end
end
