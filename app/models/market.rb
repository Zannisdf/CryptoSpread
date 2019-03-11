class Market < ApplicationRecord
  has_many :coin_histories, dependent: :destroy
  has_many :coins, through: :coin_histories
end
