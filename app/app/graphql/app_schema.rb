# frozen_string_literal: true

class AppSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # For batch-loading (see https://graphql-ruby.org/dataloader/overview.html)
  use GraphQL::Dataloader

  # GraphQL-Ruby calls this when something goes wrong while running a query:
  def self.type_error(err, context)
    # if err.is_a?(GraphQL::InvalidNullError)
    #   # report to your bug tracker here
    #   return nil
    # end
    super
  end

  # Union and Interface Resolution
  def self.resolve_type(_abstract_type, _obj, _ctx)
    Types.const_get("#{obj.class}Type")
  end

  # Limit the size of incoming queries:
  max_query_string_tokens(5000)

  # Stop validating when it encounters this many errors:
  validate_max_errors(100)

  # Relay-style Object Identification:

  # Return a string UUID for `object`
  def self.object_from_id(node_id, _ctx = {})
    return nil unless node_id

    type_name, object_id = self::UniqueWithinType.decode(node_id, separator: ':')
    Object.const_get(type_name).find(object_id)
  rescue NameError
    nil
  end

  def self.id_from_object(object, _type = nil, _ctx = {})
    return nil unless object

    klass_name = object.class.name.demodulize
    self::UniqueWithinType.encode(klass_name, object.id, separator: ':')
  end
end
