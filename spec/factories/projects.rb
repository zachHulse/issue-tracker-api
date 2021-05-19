FactoryBot.define do
  factory :project do
    name { ('a'..'z').to_a.shuffle.join }
    description { "Description" }
    abbreviation { ('A'..'Z').to_a.shuffle[0, 3].join }
  end
end
