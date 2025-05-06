# frozen_string_literal: true

module Subscriptions
  # BaseSubscription
  class BaseSubscription < GraphQL::Schema::Subscription
    argument_class Types::BaseArgument
    field_class Types::BaseField
    object_class Types::BaseObject
  end
end
