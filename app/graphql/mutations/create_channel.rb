# frozen_string_literal: true

module Mutations
  # CreateChannel
  class CreateChannel < BaseMutation
    field :channel, Types::ChannelType, null: false

    argument :workspace_id, ID, required: true, loads: Types::WorkspaceType

    def resolve(workspace:, **args)
      channel = workspace.channels.create!(args)

      { channel: channel }
    end
  end
end
