class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea


  validates :user_id, presence: true
  validates :idea_id, presence: true, uniqueness: { scope: :user_id }
end
