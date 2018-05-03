FactoryBot.define do
  factory :list do
    name { FFaker::Book.title }
    board
  end
end
