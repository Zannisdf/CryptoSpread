class Market < ApplicationRecord
  has_many :coin_histories
  has_many :coins, through: :coin_histories
end
