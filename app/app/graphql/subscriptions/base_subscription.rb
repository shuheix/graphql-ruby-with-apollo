# frozen_string_literal: true

module Subscriptions
  # BaseSubscription
  class BaseSubscription < GraphQL::Schema::Subscription
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject
  end
end
