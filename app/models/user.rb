class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :portfolios, dependent: :destroy
  has_many :coins, through: :portfolios
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :ban, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  enum role: %i[visit user moderator]

  def self.update_ban
    where('ban > ?', 0).each do |user|
      user.update(ban: user.ban - 1)
    end
  end
end
