FactoryBot.define do
  factory :role do
    name { ('a'..'z').to_a.shuffle.join }
  end
end
