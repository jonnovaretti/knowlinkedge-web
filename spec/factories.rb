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

FactoryBot.define do
  factory :material, class: 'Material' do
    id { 20 }
    material_type { Material::MATERIAL_TYPE[:mind_map] }
  end
end

FactoryBot.define do
  factory :reference, class: 'Reference' do
    id { 2 }
    title { 'Building microservice' }
    authors { 'Sam Newton, Martin Fowler' }
  end
end
