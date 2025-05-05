# frozen_string_literal: true

module Mutations
  # SubscriptionTrigger
  class SubscriptionTrigger < BaseMutation
    field :test, String, null: false

    def resolve(**args)
      context.schema.subscriptions.trigger(
        :server_time_received,
        {},
        {}
      )

      { test: 'test' }
    end
  end
end
