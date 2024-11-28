FactoryBot.define do
  factory :post do
    name { "Good Cat" }
    content { "HELLO, my name is Blah." }
    association :owner, factory: :user
  end
end
