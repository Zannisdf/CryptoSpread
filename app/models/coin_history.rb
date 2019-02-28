class CoinHistory < ApplicationRecord
  belongs_to :coin
  belongs_to :market
end
