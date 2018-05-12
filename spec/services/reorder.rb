require 'rails_helper'

RSpec.describe Reorder do
  let(:board_1)   { create(:board) }
  let!(:list_1)  { create(:list, board: board_1) }
  let!(:list_2)  { create(:list, board: board_1) }
  let!(:list_3)  { create(:list, board: board_1) }

  let(:board_2)   { create(:board) }
  let!(:list_4)  { create(:list, board: board_2) }
  let!(:list_5)  { create(:list, board: board_2) }
  let!(:list_6)  { create(:list, board: board_2) }

  before do
    Reorder.new(
      item: list_1,
      position: 2,
      parent_key: "board_id",
      parent_id: parent_id
    ).call
  end

  context 'moving within the same list' do
    let(:parent_id) { board_1.id }

    it 'moves list to new position' do
      expect(board_1.reload.lists).to eq([list_2, list_1, list_3])
    end
  end

  context 'moving to another list' do


    let(:parent_id) { board_2.id }

    it 'moves list to new position' do
      expect(board_1.reload.lists).to eq([list_2, list_3])
      expect(board_2.reload.lists).to eq([list_4, list_1, list_5, list_6])
    end
  end
end
