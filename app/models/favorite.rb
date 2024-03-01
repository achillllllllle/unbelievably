class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :wonder

  validates :user, uniqueness: { scope: :wonder_id }
end
