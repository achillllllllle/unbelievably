class Wonder < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user

  validates :title, :price_per_day, :location, :type, presence: true
end
