FactoryGirl.define do
  factory :charge do
    customer nil
    paid false
    amount 1
    currency "MyString"
    refunded false
  end
end
