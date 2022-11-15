class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :character
  validates :start_date, :end_date, presence: true
  validates :status, presence: true
end
