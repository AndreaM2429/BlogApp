FactoryBot.define do
  factory :post do
    title { 'Test posts title' }
    text { 'Test posts description' }
    comments_counter { 0 }
    association :author, factory: :user
  end
end
