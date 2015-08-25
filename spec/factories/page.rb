FactoryGirl.define do
  factory :page do
    body "Blah Blah Blah"
    sequence(:order){|n| n }
    sequence(:title){|n| "title_#{n}" }
    sequence(:url_key){|n| "url_key_#{n}" }
  end
end
