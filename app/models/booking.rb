class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :toilet
  validates :status, presence: true
end
