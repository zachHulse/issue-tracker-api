FactoryBot.define do
  factory :sprint do
    project { nil }
    start { Date.today }
    finish { Date.today }
  end
end
