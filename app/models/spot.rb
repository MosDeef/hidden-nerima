class Spot < ApplicationRecord
  validates :name, :sub_category, :location, :description, :category, :user, presence: true
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many_attached :photos
  enum category: [:location, :food, :experience, :transportation]
end
