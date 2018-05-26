class List < ApplicationRecord
  belongs_to :board
  has_many :cards, -> { order(position: :asc) }, dependent: :destroy
  acts_as_list scope: :board, top_of_list: 0, add_new_at: :top
end
