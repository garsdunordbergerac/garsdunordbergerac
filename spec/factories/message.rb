FactoryGirl.define do
  factory :message do
    content { Forgery(:lorem_ipsum).words(20) }
    from    { Forgery(:internet).email_address }
    subject { Forgery(:lorem_ipsum).words(4) }
    to      { Forgery(:internet).email_address }
  end
end
