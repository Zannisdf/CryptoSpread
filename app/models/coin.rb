class Coin < ApplicationRecord
  has_many :coin_histories
  has_many :markets, through: :coin_histories
  has_many :portfolios
  has_many :users, through: :portfolios
  has_many :comments

  def price(date)
    prices = coin_histories.where(
      created_at: (date - 5.minutes)..date
    ).pluck(:price)
    if prices.count.zero?
      nil
    else
      prices.sum / prices.count
    end
  end

  def daily_price_change
    today = Time.zone.now
    # yesterday = today - 24.hours
    yesterday = today - 5.minutes
    if price(today).nil? || price(yesterday).nil?
      'No hay información.'
    else
      (((price(today) - price(yesterday)) / price(today)) * 100).round(2).to_s
    end
  end
end
