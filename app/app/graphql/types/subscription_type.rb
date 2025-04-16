# frozen_string_literal: true

module Types
  # SubscriptionType
  class SubscriptionType < Types::BaseObject
    field :server_time_received, subscription: ::Subscriptions::ServerTimeReceived
  end
end
