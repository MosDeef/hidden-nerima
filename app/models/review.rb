class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :user, :spot, :comment, :rating, presence: true
  validates :content, length: {minimum: 20}
end
