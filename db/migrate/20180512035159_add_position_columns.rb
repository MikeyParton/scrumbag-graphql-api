class AddPositionColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :position, :integer
    add_column :lists, :position, :integer
  end
end
