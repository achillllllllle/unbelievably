class Wonder < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  has_many_attached :photos
  geocoded_by :location

  after_validation :geocode, if: :will_save_change_to_location?
  validates :title, :price_per_participant, :location, :category, presence: true
end
