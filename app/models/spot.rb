class Spot < ApplicationRecord
  geocoded_by :location
  validates :name, :sub_category, :location, :description, :category, :user, presence: true
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many_attached :photos
  enum category: [:location, :food, :experience, :transportation]

  def average_rating
    average = nil
    if reviews.empty?
      return average
    else
      sum = 0
      reviews.each do |review|
        sum += review.rating
      end
      average = sum.to_f / reviews.length
    end
    return average.to_i if average.to_i == average

    return average.round(1)
  end
end
