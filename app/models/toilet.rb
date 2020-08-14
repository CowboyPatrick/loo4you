class Toilet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :photo, presence: true
  geocoded_by :address
  validates :rating, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
