# README


https://graphql-ruby.org/

## RelayStyle
UUIDを有効にする

posgreのver13より古い場合
```ruby
enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
```

posgreのver13以上
```ruby
# config/allication.rb


```
