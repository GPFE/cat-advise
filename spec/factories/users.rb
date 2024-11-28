FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "hahaha22" }
    sequence(:id) {|n| n }
  end
end
