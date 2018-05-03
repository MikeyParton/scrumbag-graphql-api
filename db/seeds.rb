3.times do
  board = FactoryBot.create(:board)

  10.times do
    list = FactoryBot.create(:list, board: board)

    10.times do
      card = FactoryBot.create(:card, list: list)
    end
  end
end
