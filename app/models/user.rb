class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, dependent: :destroy
  has_many :reservations
  has_many :wonders, dependent: :destroy
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Validation
  validate :avatar_presence
  validates :username, :phone, :birth_date, presence: true
  validates :username, format: { with: /[a-z0-9_-]{3,15}/ }
  validates :username, :email, :phone, uniqueness: true
  validates :phone, format: { with: /(?:0|\+33 ?|0?0?33 ?|)([1-9] ?(?:[0-9] ?){8})/ }


  private

  def avatar_presence
    errors.add(:avatar, "must be attached") unless avatar.attached?
  end
end
