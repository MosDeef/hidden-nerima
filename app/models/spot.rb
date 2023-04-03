class Spot < ApplicationRecord
  validates :name, :sub_category, :location, :description, :category, :user, presence: true
  belongs_to :user
  has_many :reviews
  has_many :bookmarks
  has_many_attached :photos
  enum category: [:location, :food, :experience, :transportation]
end
