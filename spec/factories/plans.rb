FactoryGirl.define do
  factory :plan do
    name{Faker::Name.name}
    product{}
  end
end
