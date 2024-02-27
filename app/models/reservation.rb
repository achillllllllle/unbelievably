class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :wonder

  validates :start_date, :end_date, :price, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
end
