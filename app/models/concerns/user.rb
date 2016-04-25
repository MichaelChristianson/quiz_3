class User < ActiveRecord::Base
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :idea_groups, through: :memberships, source: :idea

  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
