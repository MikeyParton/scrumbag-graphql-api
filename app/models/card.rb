class Card < ApplicationRecord
  belongs_to :list
  has_one :board, through: :list

  acts_as_list scope: :list, top_of_list: 0, add_new_at: :top
end
