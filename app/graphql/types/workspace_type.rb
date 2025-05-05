# frozen_string_literal: true

module Types
  class WorkspaceType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :name, String, null: false
    field :channels, [ChannelType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
