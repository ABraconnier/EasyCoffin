class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, :location, :account_number, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
