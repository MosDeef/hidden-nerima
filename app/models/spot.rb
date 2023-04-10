class Spot < ApplicationRecord
  geocoded_by :location
  validates :name, :sub_category, :location, :description, :category, :user, presence: true
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :reviews
  has_many :bookmarks, dependent: :destroy
  has_many_attached :photos
  enum category: [:location, :food, :experience, :transportation]
end
