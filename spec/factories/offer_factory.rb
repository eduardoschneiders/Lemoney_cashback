FactoryBot.define do
  factory :offer do
    sequence(:advertiser_name) { |n| "Offer #{n}"}
    start_at { Time.zone.now - 1.day }
    end_at { Time.zone.now + 15.days }
    enabled { true }
    premium { false }


    trait :premium do
      premium { true }
    end

    trait :disabled do
      enabled { false }
    end
  end
end
