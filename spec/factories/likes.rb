FactoryBot.define do
  factory :like do
    association :post
    association :author, factory: :user
  end
end
