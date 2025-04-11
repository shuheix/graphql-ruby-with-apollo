module Resolvers
  class WorkspaceResolver < BaseResolver
    type [Types::WorkspaceType], null: false

    def resolve(**_args)
      Workspace.all
    end
  end
end
