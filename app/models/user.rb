class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :portfolios, dependent: :destroy
  has_many :coins, through: :portfolios
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  enum role: %i[visit user moderator]
end
