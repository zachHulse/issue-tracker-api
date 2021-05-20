class Issue < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  belongs_to :project
  belongs_to :sprint, optional: true
end
