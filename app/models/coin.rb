class Coin < ApplicationRecord
  has_many :coin_histories, dependent: :destroy
  has_many :markets, through: :coin_histories
  has_many :portfolios, dependent: :destroy
  has_many :users, through: :portfolios
  has_many :comments, dependent: :destroy

  def price(date = Time.zone.now)
    latest_coin_history = coin_histories.where(
      'created_at < ?', date
    ).last
    latest_coin_history.present? ? latest_coin_history.price : nil
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
    prices = coin_histories.group_by_day(:created_at, range: range).average(:price)
    prices.map do |date, price|
      if price.zero?
        [date, nil]
      else
        [date, price.round(6)]
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

  def spread
    latest_coin_histories = coin_histories.group(:market).maximum(:id).values
    prices = latest_coin_histories.map do |id|
      CoinHistory.find(id).price
    end
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

  def chart_data
    coin_histories.where(
      'created_at > ? AND market_id = ?',
      Time.zone.now - 1.day,
      Market.find_by(name: 'Gate.io').id
    ).group_by_hour(:created_at).count.map do |date|
      date = date.first
      [
        date.to_time.localtime.strftime('%I %P %a'),
        coin_histories.where(
          created_at: date..date + 1.hour,
          market: Market.find_by(name: 'Gate.io')
        ).minimum(:price).to_f,
        coin_histories.where(
          'created_at > ? AND market_id = ?',
          date.beginning_of_hour,
          Market.find_by(name: 'Gate.io').id
        ).first.price.to_f,
        coin_histories.where(
          'created_at < ? AND market_id = ?',
          date.end_of_hour,
          Market.find_by(name: 'Gate.io').id
        ).last.price.to_f,
        coin_histories.where(
          created_at: date..date + 1.hour,
          market: Market.find_by(name: 'Gate.io')
        ).maximum(:price).to_f
      ]
    end
  end
end
