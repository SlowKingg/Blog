FactoryBot.define do
  factory :comment do
    email { 'MyString' }
    body { 'MyText' }
    post { nil }
  end
end
