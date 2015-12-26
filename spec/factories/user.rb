FactoryGirl.define do
  factory :user do
    sequence(:email) { |a| "#{a}@dole.com" }
    password "12345678"

    trait :with_domain do
      after(:create) do |user|
        create(:domain, user: user)
      end
    end
  end
end
