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
    body { "What if I say by Fireboy" }
    recipient_id { "1" }
    sender_id { "2" }
  end
end