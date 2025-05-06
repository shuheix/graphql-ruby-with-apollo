# frozen_string_literal: true

module Mutations
  class CreateMessage < BaseMutation
    field :message, Types::MessageType, null: false

    argument :channel_id, ID, required: true, loads: Types::ChannelType
    argument :content, String, required: true

    def resolve(channel:, **args)
      message = channel.messages.create!(args)

      AppSchema.subscriptions.trigger("message_received",
                                      {},
                                      { count: Message.count })

      { message: message }
    end
  end
end
