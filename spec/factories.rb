FactoryBot.define do
  factory :user do
    username { "test_user" }
    password { "test_password" }
  end

  factory :another_user, class: 'User' do
    username { "another_user" }
    password { "test_password" }
  end

  factory :message do
    body { "Hi, are you online?" }
  end

  factory :another_message, class: 'Message' do
    body { "Hey, Yes! Welcome to MessageMe" }
  end
end