class Toilet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
