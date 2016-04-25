class Idea < ActiveRecord::Base
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :memberships
  has_many :users, through: :memberships, source: :user

  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :description, presence: true
end
