FactoryGirl.define do
  factory :comment do
    content 'Great stuff!'
    user
    post
  end
end
