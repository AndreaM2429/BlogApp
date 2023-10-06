FactoryBot.define do
  factory :user do
    name { 'Tom' }
    photo { 'https://unsplash.com/photos/F_-0BxGuVvo' }
    bio { 'Teacher from Mexico.' }
    postsCounter { 0 }
    email { 'example@example.com' }
    password { '1234567890' }
    confirmation_token { rand(1000..2000).to_s }
    confirmed_at { Time.now }
    confirmation_sent_at { Time.now }
    role { 'Admin' }
  end
end
