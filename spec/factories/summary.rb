FactoryGirl.define do
  factory :summary do
    happened_at { Date.today }
    title       { Forgery(:lorem_ipsum).words(4) }
  end
end
