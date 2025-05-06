# frozen_string_literal: true

module Types
  # MutationType
  class MutationType < Types::BaseObject
    field :create_message, mutation: Mutations::CreateMessage
    field :create_channel, mutation: Mutations::CreateChannel
    field :create_workspace, mutation: Mutations::CreateWorkspace
  end
end
