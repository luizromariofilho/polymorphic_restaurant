FactoryBot.define do
  factory :review_on_restaurant, class: Review do
    comment { Faker::GreekPhilosophers.quote }
    association :reviewable, factory: :restaurant
  end
  factory :review_on_event, class: Review do
  	comment { Faker::GreekPhilosophers.quote }
    association :reviewable, factory: :event
  end
end