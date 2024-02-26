class Wonder < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :title, :price_per_day, :location, :type, presence: true
end
