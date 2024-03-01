class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, dependent: :destroy
  has_many :reservations
  has_many :wonders, dependent: :destroy
  has_many :favorites
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation
  validates :username, :phone, :birth_date, presence: true
  validates :username, format: { with: /[a-z0-9_-]{3,15}/ }
  validates :username, :email, :phone, uniqueness: true
  validates :phone, format: { with: /(?:0|\+33 ?|0?0?33 ?|)([1-9] ?(?:[0-9] ?){8})/ }

  # Ajoute un avatar par défaut si l'utilisateur n'en a pas
  before_create :add_default_avatar

  def add_default_avatar
    unless avatar.attached?
      # Assurez-vous que le chemin d'accès et le nom du fichier correspondent à votre fichier d'avatar par défaut
      avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar.jpeg')), filename: 'avatar.jpeg', content_type: 'image/jpeg')
    end
  end

  def has_favorite?(wonder)
    Favorite.find_by(user: self, wonder: wonder).present?
  end

end
