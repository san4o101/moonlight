FactoryBot.define do
  factory :manager_notification do
    users { nil }
    bill { nil }
    message { "MyString" }
  end
end
