class Resolvers::MoveList < GraphQL::Function
  argument :id, !types.ID
  argument :position, !types.Int

  type Types::BoardType

  def call(_obj, args, ctx)
    list = List.includes(:board).find(args[:id])

    Reorder.new(
      item: list,
      position: args[:position],
      parent_key: "board_id",
      parent_id: list.board_id
    ).call

    list.board
  end
end
