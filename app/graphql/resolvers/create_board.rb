class Resolvers::CreateBoard < GraphQL::Function
  argument :name, !types.String

  type Types::BoardType

  def call(_obj, args, ctx)
    Board.create(name: args[:name])
  end
end
