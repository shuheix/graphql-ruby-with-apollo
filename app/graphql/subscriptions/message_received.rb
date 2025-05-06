# frozen_string_literal: true
module Subscriptions
  # ServerTimeReceived
  class MessageReceived < BaseSubscription
    field :count, Integer, null: false

    def subscribe(**_args)
      Rails.logger.info "MessageReceived.subscribe called with args: #{_args}"
      { count: Message.count }
    end

    def update(**_args)
      { count: Message.count }
    end
  end
end
