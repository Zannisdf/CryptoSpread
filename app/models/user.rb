class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :portfolios
  has_many :coins, through: :portfolios
  has_many :comments

  enum role: %i[visit user moderator]
end
