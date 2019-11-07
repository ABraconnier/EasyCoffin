class Mourner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :price_range, :account_number, :first_name, :last_name, presence: true
  # validates :price_range, numericality: { only_integer: true }
  include PgSearch::Model
  has_many :prestations
  has_many :clients, through: :prestations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  pg_search_scope :search_by_price,
    against: [:price_range],
    using: {
      tsearch: { prefix: false, any_word: true } # <-- now `superman batm` will return something!
    }
  pg_search_scope :search_by_location,
    against: [:location],
    using: {
      tsearch: { prefix: false, any_word: true } # <-- now `superman batm` will return something!
    }
  mount_uploader :photo, PhotoUploader
end
