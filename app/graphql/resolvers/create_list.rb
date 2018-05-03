class Resolvers::CreateList < GraphQL::Function
  argument :board_id, !types.ID
  argument :name, !types.String

  type Types::ListType

  def call(_obj, args, ctx)
    List.create(
      board: Board.find(args[:board_id]),
      name: args[:name]
    )
  end
end
