FactoryBot.define do
  factory :user do
    email { ('a'..'z').to_a.shuffle.join + '@example.com' }
    password { "1234qwer" }
  end
end
