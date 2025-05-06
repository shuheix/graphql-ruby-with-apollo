# frozen_string_literal: true

module Resolvers
  class ChannelResolver < BaseResolver
    type [Types::ChannelType], null: false

    def resolve(**_args)
      Channel.all
    end
  end
end

