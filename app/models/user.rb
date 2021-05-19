class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  has_many :assignments
  has_many :roles, through: :assignments
end
