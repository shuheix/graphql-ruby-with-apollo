# frozen_string_literal: true

module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :subscription_trigger, mutation: Mutations::SubscriptionTrigger
    field :create_message, mutation: Mutations::CreateMessage
    field :create_channel, mutation: Mutations::CreateChannel
    field :create_workspace, mutation: Mutations::CreateWorkspace

    field :subscription_trigger, mutation: Mutations::SubscriptionTrigger
  end
end
