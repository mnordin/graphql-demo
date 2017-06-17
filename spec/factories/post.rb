FactoryGirl.define do
  factory :post do
    title 'Title'
    content 'Text'
    user
  end
end
