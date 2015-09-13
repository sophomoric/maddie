FactoryGirl.define do
  factory :user do
    sequence(:email) { |a| "#{a}@dole.com" }
    password "12345678"
  end
end
