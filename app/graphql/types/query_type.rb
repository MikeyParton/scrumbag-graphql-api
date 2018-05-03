Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :all_boards, types[Types::BoardType] do
    description "Get All Boards"
    resolve ->(obj, args, ctx) {
      Board.all
    }
  end

  field :board, Types::BoardType do
    description "Get a single Board"
    argument :id, !types.ID

    resolve ->(obj, args, ctx) {
      Board.find(args[:id])
    }
  end

  field :list, Types::CardType do
    description "Get a single List"
    argument :id, !types.ID

    resolve ->(obj, args, ctx) {
      List.find(args[:id])
    }
  end

  field :card, Types::CardType do
    description "Get a single Card"
    argument :id, !types.ID

    resolve ->(obj, args, ctx) {
      Card.find(args[:id])
    }
  end
end
