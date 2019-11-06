class Mourner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :price_range, :account_number, :first_name, :last_name, presence: true
  # validates :price_range, numericality: { only_integer: true }
  has_many :prestations
  has_many :clients, through: :prestations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
