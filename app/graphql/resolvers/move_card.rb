class Resolvers::MoveCard < GraphQL::Function
  argument :id, !types.ID
  argument :position, !types.Int
  argument :list_id, !types.ID

  type Types::BoardType

  def call(_obj, args, ctx)
    card = Card.includes(:board).find(args[:id])

    Reorder.new(
      item: card,
      position: args[:position],
      parent_key: "list_id",
      parent_id: args[:list_id]
    ).call

    card.board
  end
end
