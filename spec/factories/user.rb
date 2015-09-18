FactoryGirl.define do
  factory :user do
    domain "www.example.com"
    sequence(:email) { |a| "#{a}@dole.com" }
    password "12345678"
  end
end
