FactoryBot.define do
  factory :card do
    name { FFaker::Book.title }
    list
  end
end
