FactoryGirl.define do
  factory :project do
    title "Mona Lisa"
    description "A painting of a smile"
    height 6
    width 6
    year 1517
    price 100

    trait :avatar do
      url "www.project-avatar.com"
    end
  end
end
