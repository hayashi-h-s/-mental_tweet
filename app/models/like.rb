class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :psot_id, presence: true
end
