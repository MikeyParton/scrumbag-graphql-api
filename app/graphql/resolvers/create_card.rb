class Resolvers::CreateCard < GraphQL::Function
  argument :list_id, !types.ID
  argument :name, !types.String

  type Types::CardType

  def call(_obj, args, ctx)
    Card.create(
      list: List.find(args[:list_id]),
      name: args[:name]
    )
  end
end
