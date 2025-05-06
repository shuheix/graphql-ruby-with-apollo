# frozen_string_literal: true

module Types
  # SubscriptionType
  class SubscriptionType < Types::BaseObject
    field :message_received, subscription: ::Subscriptions::MessageReceived
  end
end
