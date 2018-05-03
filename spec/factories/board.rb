FactoryBot.define do
  factory :board do
    name { FFaker::Book.title }
  end
end
