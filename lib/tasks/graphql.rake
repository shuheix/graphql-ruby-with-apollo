namespace :graphql do
  desc 'Dump GraphQL schema to the project root directory'
  task dump_schema: :environment do
    # Get a string containing the definition in GraphQL IDL:
    schema_defn = AppSchema.to_definition
    # Choose a place to write the schema dump:
    schema_path = 'schema.graphql'
    # Write the schema dump to that file:
    File.write(Rails.root.join(schema_path), schema_defn)
    puts "Updated #{schema_path}"
  end
end
