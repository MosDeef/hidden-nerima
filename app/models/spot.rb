class Spot < ApplicationRecord
  validates :name, :location, :description, :category, :user, presence: true
  has_one :user
  has_many :reviews
  has_many :bookmarks
  has_many_attached :photos

end
