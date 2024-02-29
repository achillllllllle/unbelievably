class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :wonder

  validates :book_date, :nb_participants, :price, presence: true
  validates :nb_participants, numericality: {greater_than: 0}
end
