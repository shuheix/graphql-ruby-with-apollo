# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # node
    include GraphQL::Types::Relay::HasNodeField
    # nodes
    include GraphQL::Types::Relay::HasNodesField

    field :workspaces, resolver: Resolvers::WorkspaceResolver
  end
end
