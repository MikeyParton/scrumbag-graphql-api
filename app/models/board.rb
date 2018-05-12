class Board < ApplicationRecord
  has_many :lists, -> { order(position: :asc) }
  has_many :cards, through: :lists, dependent: :destroy
end
