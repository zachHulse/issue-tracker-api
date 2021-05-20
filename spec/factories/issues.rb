FactoryBot.define do
  factory :issue do
    project
    sprint { nil }
    name { ('a'..'z').to_a.shuffle.join }
    description { "Description" }
    story_points { 1 }
    code {('a'..'z').to_a.shuffle[0,3].join + '-37' }
  end
end
