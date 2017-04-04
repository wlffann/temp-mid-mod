FactoryGirl.define do
  factory :user do
    email Faker::Internet.email 
    passsword "boom"
  end
end
