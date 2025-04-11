# frozen_string_literal: true

module Types
  class ChannelType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :messages, [MessageType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
