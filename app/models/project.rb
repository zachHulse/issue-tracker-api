class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, uniqueness: true, length: {maximum: 3}

  has_many :issues
  has_many :sprints
end
