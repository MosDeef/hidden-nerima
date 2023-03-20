class Spot < ApplicationRecord
  validates :location, :description, :category, :type, :user, presence: true
  has_one :user
end
