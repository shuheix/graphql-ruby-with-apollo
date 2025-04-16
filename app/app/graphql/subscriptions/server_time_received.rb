# frozen_string_literal: true
module Subscriptions
  # ServerTimeReceived
  class ServerTimeReceived < BaseSubscription
    field :iso8601, String, null: false
    field :unix_timestamp, Integer, null: false

    def subscribe(**_args)
      time = Time.now
      {
        iso8601: time.iso8601,
        unix_timestamp: time.to_i
      }
    end

    def update(**_args)
      time = Time.now
      {
        iso8601: time.iso8601,
        unix_timestamp: time.to_i
      }
    end
  end
end
