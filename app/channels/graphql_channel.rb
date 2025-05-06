class GraphqlChannel < ApplicationCable::Channel
  # https://graphql-ruby.org/api-doc/1.11.3/GraphQL/Subscriptions/ActionCableSubscriptions.html
  def execute(data)
    query = data['query']
    variables = ensure_hash(data['variables'])
    operation_name = data['operationName']
    context = {
      channel: self,
    }
    return if query.blank?

    result = AppSchema.execute(query,
                                   variables:,
                                   context:,
                                   operation_name:)

    payload = {
      result: result.to_h,
      more: result.subscription?
    }

    # Append the subscription id
    @subscription_ids << result.context[:subscription_id] if result.context[:subscription_id]

    transmit(payload)
  end

  def unsubscribed
    @subscription_ids&.each do |sid|
      AppSchema.subscriptions.delete_subscription(sid)
    end
  end

  def subscribed
    @subscription_ids = []
  end

  private

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      fail ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
