ScrumbagGraphqlSchema = GraphQL::Schema.define do

  # GraphQL Batch
  lazy_resolve(Promise, :sync)
  use GraphQL::Batch

  mutation(Types::MutationType)
  query(Types::QueryType)
end
