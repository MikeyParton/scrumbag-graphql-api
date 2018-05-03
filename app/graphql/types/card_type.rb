Types::CardType = GraphQL::ObjectType.define do
  name "Card"
  field :id, !types.ID
  field :name, types.String
  field :list, Types::ListType
end