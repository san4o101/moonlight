FactoryBot.define do
  factory :city do
    name { 'Kiev' }
    country { country.id }
  end
end
