class Issue < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  belongs_to :project, counter_cache: true
  belongs_to :sprint, optional: true
end
