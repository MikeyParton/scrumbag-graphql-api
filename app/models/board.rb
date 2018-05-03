class Board < ApplicationRecord
  has_many :lists
  has_many :cards, through: :lists, dependent: :destroy
end
