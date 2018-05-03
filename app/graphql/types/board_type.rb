Types::BoardType = GraphQL::ObjectType.define do
  name "Board"
  field :id, !types.ID
  field :name, types.String
  field :lists, types[Types::ListType]
end
