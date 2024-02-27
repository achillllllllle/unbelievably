class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :wonder

  validates :start_date, :end_date, :price, presence: true
end
