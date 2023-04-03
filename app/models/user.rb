class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :bookmarks, dependent: :destroy
  has_many :spots, dependent: :destroy
  validates :first_name, :last_name, presence: true
end
