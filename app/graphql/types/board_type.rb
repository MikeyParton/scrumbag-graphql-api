Types::BoardType = GraphQL::ObjectType.define do
  name "Board"
  field :id, !types.ID
  field :name, types.String

  field :lists do
    type types[Types::ListType]

    resolve lambda { |obj, args, _ctx|
      AssociationLoader.for(::Board, :lists).load(obj)
    }
  end
end
