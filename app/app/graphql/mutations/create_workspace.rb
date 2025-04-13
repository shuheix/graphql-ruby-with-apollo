# frozen_string_literal: true

module Mutations
  # CreateWorkspace
  class CreateWorkspace < BaseMutation
    field :workspace, Types::WorkspaceType, null: false

    argument :name, String, required: true

    def resolve(**args)
      workspace = Workspace.create!(args)

      { workspace: workspace }
    end
  end
end
