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
  
end
```