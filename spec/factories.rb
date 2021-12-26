FactoryBot.define do
  factory :access_token, class: 'Doorkeeper::AccessToken' do
    expires_in { 2.hours }
    scopes { 'public' }
  end
end

FactoryBot.define do
  factory :user do
    email { 'an_email@any.com' }
    password { Devise.friendly_token[0, 20] }
  end
end

FactoryBot.define do
  factory :study, class: 'Study' do
    id { 5 }
    title { 'Title factory' }
    area { 'Technology' }
  end
end
