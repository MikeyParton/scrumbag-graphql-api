Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :all_boards, types[Types::BoardType] do
    description "Get All Boards"
    resolve ->(obj, args, ctx) {
      Board.all.includes(lists: [:cards])
    }
  end

  field :board, Types::BoardType do
    description "Get a single Board"
    argument :id, !types.String

    resolve ->(obj, args, ctx) {
      Board.find_by(id: args[:id]).includes(lists: [:cards])
    }
  end

  field :list, Types::CardType do
    description "Get a single List"
    argument :id, !types.String

    resolve ->(obj, args, ctx) {
      List.find_by(id: args[:id])
    }
  end

  field :card, Types::CardType do
    description "Get a single Card"
    argument :id, !types.String

    resolve ->(obj, args, ctx) {
      Card.find_by(id: args[:id])
    }
  end
end
