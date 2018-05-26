Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :create_board, function: Resolvers::CreateBoard.new
  field :create_list, function: Resolvers::CreateList.new
  field :move_list, function: Resolvers::MoveList.new
  field :create_card, function: Resolvers::CreateCard.new
  field :move_card, function: Resolvers::MoveCard.new
end
