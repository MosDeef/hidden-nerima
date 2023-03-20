class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :user, :spot, :comment, :rating, presence: true
  has_one :user
  has_one :spot
end
