FactoryBot.define do

  factory :user, class: 'User' do
    email { FFaker::Internet.email }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    password { 'secret123' }
    password_confirmation { 'secret123' }
    confirmed_at { '2019-11-01 00:01:00' }
    role { User.roles[:user] }

    factory :admin, class: 'User' do
      role { User.roles[:admin] }
    end
  end

end

