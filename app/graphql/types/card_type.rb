Types::CardType = GraphQL::ObjectType.define do
  name "Card"
  field :id, !types.ID
  field :name, types.String
  field :list_id, !types.ID

  field :list do
    type Types::ListType
    resolve lambda { |obj, args, _ctx|
      AssociationLoader.for(::Card, :list).load(obj)
    }
  end
end
