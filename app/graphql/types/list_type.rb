Types::ListType = GraphQL::ObjectType.define do
  name "List"
  field :id, !types.ID
  field :name, types.String
  field :board, Types::BoardType
  field :cards, types[Types::CardType]
end
