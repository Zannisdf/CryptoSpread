module CoinsHelper
  def time_frame(start_date = nil)
    current = Time.zone.now
    start_date = current - 24.hours if start_date.nil?
    [start_date, current]
  end

  def latest_data(coin, market)
    coin_price_detail = coin.latest_coin_history(market)
    coin_daily_minmax = coin.high_low_daily(market)
    [
      coin_price_detail.price,
      coin_price_detail.bid,
      coin_price_detail.ask,
      coin_daily_minmax[:high],
      coin_daily_minmax[:low],
      coin_price_detail.volume
    ]
  end
end
