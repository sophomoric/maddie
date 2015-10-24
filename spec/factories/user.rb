FactoryGirl.define do
  factory :user do
    sequence(:domain) { |a| "www.example#{a}.com" }
    sequence(:email) { |a| "#{a}@dole.com" }
    password "12345678"
  end
end
