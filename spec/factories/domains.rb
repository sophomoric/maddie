FactoryGirl.define do
  factory :domain do
    sequence(:host) { |a| "www.example#{a}.com" }
    page_title "Example"
  end
end
