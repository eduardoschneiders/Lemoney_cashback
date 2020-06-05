FactoryBot.define do
  factory :reward do
    value { 15 }
    client { create(:client) }
    offer { create(:offer) }

    trait :confirmed do
      state { 1 }
    end
  end
end
