# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :content, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
