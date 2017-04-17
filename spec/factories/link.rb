FactoryGirl.define do
  factory :link do
    title Faker::Book.title
    url Faker::Internet.url
    user
  end
end
