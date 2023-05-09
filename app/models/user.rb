class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :spots, dependent: :destroy
  validates :first_name, :last_name, presence: true

  def full_name
    first_name.capitalize + ' ' + last_name.capitalize
  end

  def organize_spots_by_three(spots)
    spot_number = 0
    array_index = 0
    array = []
    spots.each do |spot|
      if spot_number.zero?
        array << []
      elsif (spot_number % 3).zero?
        array_index += 1
        array << []
      end
      array[array_index] << spot
      spot_number += 1
    end
    return array
  end
end
