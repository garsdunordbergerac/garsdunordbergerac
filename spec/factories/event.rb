FactoryGirl.define do
  factory :event do
    begin_at   { Date.today }
    place      { Forgery(:basic).text }
    title      { Forgery(:lorem_ipsum).words(4) }
  end
end
