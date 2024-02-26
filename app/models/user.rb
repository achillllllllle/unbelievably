class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, dependent: :destroy
  has_many :reservations
  has_many :wonders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :telephone, :birth_date, presence: true
  validates :username, format: { with: /[a-z0-9_-]{3,15}/ }
  validates :telephone, format: { with: /(?:0|\+33 ?|0?0?33 ?|)([1-9] ?(?:[0-9] ?){8})/ }
end
