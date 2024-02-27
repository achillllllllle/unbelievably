class Wonder < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  has_many_attached :photos

  validates :title, :price_per_day, :location, :category, presence: true
end
