FactoryBot.define do
  factory :like_post do
    post_id_like { 1 }
    user_id_like { 1 }
    post { nil }
    user { nil }
  end
end
