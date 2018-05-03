Types::ListType = GraphQL::ObjectType.define do
  name "List"
  field :id, !types.ID
  field :name, types.String

  field :board do
    type Types::BoardType
    resolve lambda { |obj, args, _ctx|
      AssociationLoader.for(::List, :board).load(obj)
    }
  end

  field :cards do
    type types[Types::CardType]
    resolve lambda { |obj, args, _ctx|
      AssociationLoader.for(::List, :cards).load(obj)
    }
  end
end
