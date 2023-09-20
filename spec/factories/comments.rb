FactoryBot.define do
  factory :comment do
    text { 'Test comment description' }
    association :author, factory: :user
    association :post
  end
end
