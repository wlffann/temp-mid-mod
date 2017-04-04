FactoryGirl.define do
  factory :user do
    email Faker::Internet.email 
    password "boom"
  end
end
