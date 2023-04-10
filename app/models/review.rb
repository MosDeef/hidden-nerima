class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :user, :spot, :comment, :rating, presence: true
  validates :comment, length: {minimum: 20}

  def posted_time
    "#{created_at.getlocal.day}/#{created_at.getlocal.month}/#{created_at.getlocal.year} at #{created_at.getlocal.hour}:#{created_at.getlocal.min}"
  end
end
