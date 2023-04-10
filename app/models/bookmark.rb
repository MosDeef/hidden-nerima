class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :user, :spot, presence: true
end
