# README


https://graphql-ruby.org/

## Relay
Relayスタイルのnode(id:)を使うにはglobalIDが必要なので、UUIDを有効にする

posgreのver13より古い場合
```ruby
enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
```

posgreのver13以上
pgcryptoは不要で下記を追加すれば、migration生成時に自動でid: :uuidになる
```ruby
# config/allication.rb
config.generators do |g|
    g.orm :active_record, primary_key_type: :uuid
end
```

node(id:)のqueryでobjectを取得できるようにする
```ruby
# account_type.rb
# implementsでnode interfaceを実装していることを表現する
module Types
    class AccountType < Types::BaseObject
        implements GraphQL::Types::Relay::Node
        global_id_field :id
    end
end
```

queryにnode, nodes fieldを追加
```ruby
# query_type.rb
module Types
  class QueryType < Types::BaseObject
    # node
    include GraphQL::Types::Relay::HasNodeField
    # nodes
    include GraphQL::Types::Relay::HasNodesField
  end
end
```

schemaでnodeのidから特定のobjectを解決できるように修正する
```ruby
class AppSchema < GraphQL::Schema
  def self.resolve_type(_abstract_type, _obj, _ctx)
    Types.const_get("#{obj.class}Type")
  end
end
```

object_from_idとid_from_objectを修正
```ruby
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
```