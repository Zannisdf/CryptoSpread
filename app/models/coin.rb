class Coin < ApplicationRecord
  has_many :coin_histories, dependent: :destroy
  has_many :markets, through: :coin_histories
  has_many :portfolios, dependent: :destroy
  has_many :users, through: :portfolios
  has_many :comments, dependent: :destroy

  def price(date = Time.zone.now)
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
        [date, (daily_data.pluck(:price).sum / quantity).round(6)]
      end
    end
  end

  def latest_coin_history(market)
    coin_histories.where(market: market).last
  end

  def high_low_daily(market)
    last_day_histories = coin_histories.where(
      'market_id = ? AND created_at > ?', market, Time.zone.now - 24.hours
    ).pluck(:price)
    {
      high: last_day_histories.max,
      low: last_day_histories.min
    }
  end

  def spread(markets)
    prices = markets.map { |market| latest_coin_history(market).price }
    prices = prices.reject(&:zero?)
    ((prices.max - prices.min) * 100 / prices.min).round(2)
  end

  def bid_ask_spread(markets)
    spreads = markets.map do |market|
      coin_data = latest_coin_history(market)
      ((coin_data.ask - coin_data.bid) * 100 / coin_data.bid).round(2)
    end
    spreads.max
  end
end
