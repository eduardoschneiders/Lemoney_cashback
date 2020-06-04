FactoryBot.define do
  factory :client do
    sequence(:email) { |n| "email_#{n}@gmail.com" }
    sequence(:password) { |n| "password_#{n}" }
  end
end
