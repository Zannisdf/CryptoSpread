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

  def price_change(dates)
    start_date = dates.first
    end_date = dates.last
    if price(start_date).nil? || price(end_date).nil?
      'No info'
    else
      percent = (((price(end_date) - price(start_date)) / price(end_date)) * 100)
      percent.round(2).to_s
    end
  end

  def daily_price(initial_date = nil)
    range = initial_date.nil? ? nil : initial_date.beginning_of_day..Time.zone.now
    quantities = coin_histories.group_by_day(:created_at, range: range).count
    quantities.map do |date, quantity|
      daily_data = coin_histories.where(created_at: date...(date + 1.day))
      if quantity.zero?
        [date, nil]
      else
        [date, (daily_data.pluck(:price).sum / quantity).round(2)]
      end
    end
  end
end
